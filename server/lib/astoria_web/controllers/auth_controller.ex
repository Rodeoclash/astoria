defmodule AstoriaWeb.AuthController do
  alias Astoria.{Users, Repo}
  use AstoriaWeb, :controller
  plug Ueberauth

  alias Ueberauth.Strategy.Helpers

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
    multi =
      Ecto.Multi.new()
      |> Ecto.Multi.run(:user, fn _repo, _previous ->
        Users.upsert(auth.info)
      end)
      |> Ecto.Multi.run(:oauth_authorization, fn _repo, %{user: user} ->
        case auth.provider do
          :github ->
            Users.GithubOauthAuthorizations.upsert(user, auth.credentials)
        end
      end)
      |> Ecto.Multi.run(:service_user, fn _repo, %{user: user} ->
        case auth.provider do
          :github ->
            Users.GithubUsers.upsert(user, auth.extra.raw_info.user)
        end
      end)

    case Repo.transaction(multi) do
      {:ok, %{user: user}} ->
        conn
        |> put_session("current_user_id", user.id)
        |> put_flash(:info, "You have been logged in")
        |> redirect(to: "/")

      {:error, _} ->
        conn
        |> put_flash(:error, "Problem setting up account")
        |> redirect(to: "/")
    end
  end
end
