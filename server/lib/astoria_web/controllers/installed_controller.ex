defmodule AstoriaWeb.InstalledController do
  use AstoriaWeb, :controller

  action_fallback AstoriaWeb.FallbackController

  @public_name Application.get_env(:astoria, :public_name)

  @doc ~S"""
  Callback after installing the app, redirect to user to OAuth their account
  """
  @spec callback(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def callback(conn, _params) do
    conn
    |> put_flash(:info, "#{@public_name} was installed")
    |> redirect(to: Routes.auth_path(conn, :request, :github))
  end
end
