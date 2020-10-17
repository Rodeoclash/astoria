defmodule AstoriaWeb.Admin.CurrentUserController do
  use AstoriaWeb, :controller

  action_fallback AstoriaWeb.FallbackController

  @doc ~S"""
  Allows the user to see/edit details about themselves
  """
  @spec show(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def show(conn, _params) do
    conn
    |> render("show.html")
  end
end
