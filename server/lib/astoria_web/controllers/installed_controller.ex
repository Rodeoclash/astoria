defmodule AstoriaWeb.InstalledController do
  use AstoriaWeb, :controller

  action_fallback AstoriaWeb.FallbackController

  @doc ~S"""
  Callback after installing the app, redirect to user to OAuth their account
  """
  @spec callback(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def callback(conn, %{
        "installation_id" => _installation_id,
        "provider" => _provider,
        "setup_action" => _setup_action
      }) do
    conn
    |> redirect(to: "/")
  end
end
