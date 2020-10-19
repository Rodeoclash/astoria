defmodule AstoriaWeb.Github.AuthorizedController do
  alias Astoria.{
    Github,
    GithubApplication,
    Repo,
    UserGithubOauthAuthorizations,
    Users
  }

  use AstoriaWeb, :controller

  action_fallback AstoriaWeb.FallbackController

  @doc ~S"""
  Callback after a user has installed the app in Github. Creates a user/company based on details fetched from the api.
  """
  @spec show(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def show(conn, params) do
    with client_id <- GithubApplication.client_id(),
         client_secret <- GithubApplication.client_secret(),
         {:ok, oauth_authorization} <-
           Github.Oauth.tokens_from_code(
             client_id,
             client_secret,
             params["code"]
           ),
         {:ok, %Github.GraphQL.Response{data: user_data}} <-
           UserGithubOauthAuthorizations.GraphQL.query(
             oauth_authorization,
             Github.GraphQL.Request.viewer_details()
           ),
         multi <- Ecto.Multi.new(),
         multi <-
           Ecto.Multi.run(multi, :user, fn _repo, _previous ->
             Repo.insert(%Users.User{
               email: get_in(user_data, ["viewer", "email"]),
               name: get_in(user_data, ["viewer", "name"])
             })
           end),
         multi <-
           Ecto.Multi.run(multi, :github_authorization, fn _repo, %{user: user} ->
             Repo.insert(%{oauth_authorization | user_id: user.id})
           end),
         {:ok, %{user: user}} <- Repo.transaction(multi) do
      conn
      |> put_session("user_id", user.id)
      |> redirect(to: Routes.admin_current_user_path(conn, :show))
    else
      {:error, _error} ->
        conn
        |> render("error.html")
    end
  end
end
