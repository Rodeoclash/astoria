defmodule AstoriaWeb.Github.AuthorizedController do
  alias Astoria.{
    Github,
    GithubOauthAuthorizations,
    GithubUsers,
    Repo,
    Users
  }

  use AstoriaWeb, :controller

  action_fallback AstoriaWeb.FallbackController

  @doc ~S"""
  Callback after a user has installed the app in Github. Creates a user/company based on details fetched from the api.
  """
  @spec show(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def show(conn, params) do
    with {:ok, github_oauth_authorization} <-
           GithubOauthAuthorizations.from_temporary_code(params["code"]),
         {:ok, github_client} <- GithubOauthAuthorizations.client(github_oauth_authorization),
         github_user_request <- Github.Api.V3.User.read(github_client),
         {:ok, %Github.Api.V3.Response{data: user_data}} <-
           Github.Api.V3.Request.perform(github_user_request),
         multi <- Ecto.Multi.new(),
         multi <-
           Ecto.Multi.run(multi, :user, fn _repo, _previous ->
             Repo.insert(
               %Users.User{
                 email: user_data.body["email"],
                 name: user_data.body["name"]
               },
               on_conflict: {:replace_all_except, [:id, :pub_id]},
               conflict_target: :email
             )
           end),
         multi <-
           Ecto.Multi.run(multi, :github_oauth_authorization, fn _repo, %{user: user} ->
             %{github_oauth_authorization | user_id: user.id}
             |> Repo.insert(
               on_conflict:
                 {:replace,
                  [
                    :access_token,
                    :expires_in,
                    :refresh_token,
                    :refresh_token_expires_in,
                    :token_type
                  ]},
               conflict_target: :user_id
             )
           end),
         multi <-
           Ecto.Multi.run(multi, :github_user, fn _repo, %{user: user} ->
             Repo.insert(
               %GithubUsers.GithubUser{
                 data: user_data.body,
                 github_id: user_data.body["id"],
                 user_id: user.id
               },
               on_conflict: {:replace_all_except, [:id, :pub_id]},
               conflict_target: :user_id
             )
           end),
         {:ok, %{user: user}} <- Repo.transaction(multi) do
      conn
      |> put_session("current_user_id", user.id)
      |> redirect(to: Routes.admin_current_user_path(conn, :show))
    else
      {:error, _error} ->
        conn
        |> render("error.html")
    end
  end
end
