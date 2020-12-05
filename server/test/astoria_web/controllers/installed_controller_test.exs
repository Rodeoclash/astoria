defmodule AstoriaWeb.InstalledControllerTest do
  import Astoria.Factory
  use AstoriaWeb.ConnCase

  describe "/github/authorized" do
    test "without installation existing", %{conn: conn} do
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
      assert assert get_session(conn, :github_installation_id)
    end

    test "with installation existing", %{conn: conn} do
      github_installation = insert(:github_installation)

      conn =
        get(
          conn,
          Routes.installed_path(conn, :callback, :github),
          %{
            "installation_id" => github_installation.github_id,
            "setup_action" => "install"
          }
        )

      assert redirected_to(conn) =~ "/auth/github"
      assert assert get_flash(conn, :info) == "Astoria was installed"
      assert assert get_session(conn, :github_installation_id) == github_installation.id
    end
  end
end
