defmodule AstoriaWeb.InstalledControllerTest do
  import Mox
  use AstoriaWeb.ConnCase

  setup :verify_on_exit!

  test "/github/authorized", %{conn: conn} do
    conn =
      get(
        conn,
        Routes.installed_path(conn, :callback, :github)
      )

    assert redirected_to(conn) =~ "/auth/github"
  end
end
