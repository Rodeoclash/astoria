defmodule AstoriaWeb.Github.WebhookController do
  alias Astoria.{GithubInstallations, GithubRepositories, Repo}
  require Logger
  use AstoriaWeb, :controller

  action_fallback AstoriaWeb.FallbackController

  @doc """
  Ping event from a new app being created in Github and pointed at this instance of the Astoria app
  """
  @spec create(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def create(conn, %{"hook" => %{"app_id" => _app_id}}) do
    log("App creation ping heard")

    conn
    |> send_resp(:no_content, "")
  end

  # Installation created
  @spec create(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def create(conn, %{"action" => "created", "installation" => installation}) do
    log("App installation create heard")

    GithubInstallations.upsert_from_github_data(installation)

    conn
    |> send_resp(:no_content, "")
  end

  # Installation added
  @spec create(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def create(conn, %{"action" => "added", "installation" => installation} = params) do
    log("App installation added heard")
    log(inspect(params))

    GithubInstallations.upsert_from_github_data(installation)

    # TODO: ADD REPOS

    conn
    |> send_resp(:no_content, "")
  end

  # Installation removed
  @spec create(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def create(conn, %{"action" => "removed", "installation" => installation}) do
    log("App installation removed heard")

    GithubInstallations.upsert_from_github_data(installation)

    # TODO: REMOVE REPOS

    conn
    |> send_resp(:no_content, "")
  end

  # Installation deleted
  @spec create(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def create(conn, %{"action" => "deleted", "installation" => installation}) do
    log("App installation delete heard")

    with github_installation <-
           Repo.get_by(GithubInstallations.GithubInstallation, %{github_id: installation["id"]}),
         do: Repo.delete(github_installation)

    conn
    |> send_resp(:no_content, "")
  end

  # Pull request changed
  @spec create(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def create(conn, %{
        "action" => action,
        "pull_request" => pull_request,
        "repository" => repository
      })
      when action in ["edited", "synchronize", "opened", "closed", "reopened"] do
    log("Pull request edit heard")

    with github_repository <-
           Repo.get_by(GithubRepositories.GithubRepository, %{github_id: repository["id"]}),
         do:
           GithubRepositories.GithubPullRequests.enqueue_github_repository_pull_request_sync(
             github_repository,
             pull_request["number"]
           )

    conn
    |> send_resp(:no_content, "")
  end

  # Unknown event
  @spec create(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def create(conn, params) do
    log("Unknown webhook heard")
    IO.inspect(params, limit: :infinity)

    conn
    |> send_resp(:no_content, "")
  end

  defp log(message) do
    Logger.info("Github webhook: #{message}")
  end
end
