defmodule AstoriaWeb.Admin.CurrentUserControllerTest do
  import Astoria.Factory
  use AstoriaWeb.ConnCase

  describe "/admin/current_user" do
    test "with logged in user", %{conn: conn} do
      user = insert(:user)

      conn =
        conn
        |> Plug.Test.init_test_session(%{current_user_id: user.id})
        |> get(
          Routes.admin_current_user_path(conn, :show),
          %{}
        )

      assert html_response(conn, 200) =~ "Welcome, #{user.name}"
    end
  end
end
