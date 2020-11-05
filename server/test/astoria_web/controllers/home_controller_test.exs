defmodule AstoriaWeb.PageControllerTest do
  use AstoriaWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Marketing"
  end
end
