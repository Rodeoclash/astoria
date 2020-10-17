defmodule AstoriaWeb.Github.WebhookController do
  require Logger
  use AstoriaWeb, :controller

  action_fallback AstoriaWeb.FallbackController

  @doc ~S"""
  Ping event from a new app being created in GitHub and pointed at this instance of the Astoria app
  """
  @spec create(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def create(conn, %{"hook" => %{"app_id" => _app_id}}) do
    log("App creation ping heard")

    conn
    |> send_resp(:no_content, "")
  end

  @doc ~S"""
  App was installed
  """
  @spec create(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def create(conn, %{"action" => "created", "installation" => _installation}) do
    log("App installation create heard")

    conn
    |> send_resp(:no_content, "")
  end

  @doc ~S"""
  App was uninstalled
  """
  @spec create(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def create(conn, %{"action" => "deleted", "installation" => _installation}) do
    log("App installation delete heard")

    conn
    |> send_resp(:no_content, "")
  end

  @doc ~S"""
  Unknown event from GitHub
  """
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
