defmodule AstoriaWeb.InstalledControllerTest do
  import Mox
  use AstoriaWeb.ConnCase

  setup :verify_on_exit!

  test "/github/authorized", %{conn: conn} do
    conn =
      get(
        conn,
        Routes.installed_path(conn, :callback, :github),
        %{
          "installation_id" => "123",
          "setup_action" => "install"
        }
      )

    assert redirected_to(conn) =~ "/auth/github"
    assert assert get_flash(conn, :info) == "Astoria was installed"
    assert assert get_session(conn, :github_installation_id) == "123"
  end
end
