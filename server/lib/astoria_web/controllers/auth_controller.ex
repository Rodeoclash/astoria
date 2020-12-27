defmodule AstoriaWeb.AuthController do
  alias Astoria.{Users, Repo, GithubInstallations, UserGithubInstallations, Roles}
  alias Ueberauth.Strategy.Helpers
  use AstoriaWeb, :controller
  plug Ueberauth

  def request(conn, _params) do
    render(conn, "request.html", callback_url: Helpers.callback_url(conn))
  end

  def delete(conn, _params) do
    conn
    |> put_flash(:info, "You have been logged out!")
    |> clear_session()
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    conn
    |> put_flash(:error, "Failed to authenticate.")
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    github_installation_id = get_session(conn, :github_installation_id)

    multi =
      Ecto.Multi.new()
      |> Ecto.Multi.run(:user, fn _repo, _previous ->
        Users.upsert(auth.info)
      end)
      |> Ecto.Multi.run(:github_oauth_authorization, fn _repo, %{user: user} ->
        Users.GithubOauthAuthorizations.upsert(user, auth.credentials)
      end)
      |> Ecto.Multi.run(:github_user, fn _repo, %{user: user} ->
        Users.GithubUsers.upsert(user, auth.extra.raw_info[:user])
      end)

    multi =
      if github_installation_id != nil do
        multi
        |> Ecto.Multi.run(:user_github_installation, fn _repo, %{user: user} ->
          case Repo.get(GithubInstallations.GithubInstallation, github_installation_id) do
            nil ->
              raise "Github installation id provided but github installation could not be found in the database"

            github_installation ->
              # Check here to see if ownership already exists for the installation. If so, it means a user manually triggered the installation callback endpoint then authed.
              if Repo.get_by(UserGithubInstallations.UserGithubInstallation, %{
                   github_installation_id: github_installation.id
                 }) != nil do
                raise "Went to assign ownership to installation but it already existed!"
              end

              %UserGithubInstallations.UserGithubInstallation{}
              |> UserGithubInstallations.UserGithubInstallation.changeset(%{
                github_installation_id: github_installation.id,
                user_id: user.id,
                role_id: Roles.mapping(:administrator)
              })
              |> Repo.insert()
          end
        end)
      else
        multi
      end

    case Repo.transaction(multi) do
      {:ok, %{user: user, user_github_installation: user_github_installation}} ->
        user_github_installation = Repo.preload(user_github_installation, :github_installation)
        GithubInstallations.sync(user_github_installation.github_installation)

        conn
        |> put_session(:current_user_id, user.id)
        |> put_flash(
          :info,
          "Hello #{user.name}, your app has been installed and you have been logged in"
        )

      {:ok, %{user: user}} ->
        conn
        |> put_session(:current_user_id, user.id)
        |> put_flash(:info, "Hello #{user.name}, you have been logged in")
    end
    |> put_session(:github_installation_id, nil)
    |> redirect(to: "/dashboard")
  end
end
