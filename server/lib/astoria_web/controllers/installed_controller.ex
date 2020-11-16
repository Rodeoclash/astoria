defmodule AstoriaWeb.InstalledController do
  use AstoriaWeb, :controller

  action_fallback AstoriaWeb.FallbackController

  @public_name Application.get_env(:astoria, :public_name)

  @doc ~S"""
  Callback after installing the app, redirect to user to OAuth their account
  """
  @spec callback(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def callback(conn, %{
        "installation_id" => installation_id,
        "provider" => _provider,
        "setup_action" => _setup_action
      }) do

    conn
    |> put_flash(:info, "#{@public_name} was installed")
    |> put_session(:github_installation_id, installation_id)
    |> redirect(to: Routes.auth_path(conn, :request, :github))
  end
end
