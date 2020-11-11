defmodule AstoriaWeb.AuthController do
  alias Astoria.{Users, Repo, GithubInstallations}
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
        |> Ecto.Multi.run(:github_installation, fn _repo, %{github_user: github_user} ->
          GithubInstallations.GithubInstallation.where_installation_id(github_installation_id)
          |> Repo.one()
          |> GithubInstallations.GithubInstallation.changeset(%{
            github_user_id: github_user.id
          })
          |> Repo.update()
        end)
      else
        multi
      end

    case Repo.transaction(multi) do
      {:ok, %{user: user}} ->
        conn
        |> put_session(:github_installation_id, nil)
        |> put_session("current_user_id", user.id)
        |> put_flash(:info, "Hello #{user.name}, you have been logged in")
        |> redirect(to: Routes.dashboard_path(conn, :show))
    end
  end
end
