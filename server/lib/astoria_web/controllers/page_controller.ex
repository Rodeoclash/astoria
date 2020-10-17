defmodule AstoriaWeb.PageController do
  use AstoriaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
