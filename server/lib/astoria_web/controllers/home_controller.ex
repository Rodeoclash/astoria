defmodule AstoriaWeb.HomeController do
  use AstoriaWeb, :controller

  def show(conn, _params) do
    render(conn, "show.html")
  end
end
