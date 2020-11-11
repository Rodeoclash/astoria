defmodule AstoriaWeb.Github.WebhookController do
  alias Astoria.{GithubInstallations, Repo}
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

    with {:ok, github_installation} <- GithubInstallations.upsert(installation),
         do: GithubInstallations.GithubRepositories.sync(github_installation)

    conn
    |> send_resp(:no_content, "")
  end

  # Installation updated
  @spec create(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def create(conn, %{"action" => "added", "installation" => installation}) do
    log("App installation update heard")

    with {:ok, github_installation} <- GithubInstallations.upsert(installation),
         do: GithubInstallations.GithubRepositories.sync(github_installation)

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

  @spec create(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def create(conn, params) do
    log("Unknown webhook heard")
    log(inspect(params))

    conn
    |> send_resp(:no_content, "")
  end

  defp log(message) do
    Logger.info("Github webhook: #{message}")
  end
end
