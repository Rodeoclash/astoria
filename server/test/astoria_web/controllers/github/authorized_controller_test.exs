defmodule AstoriaWeb.Github.AuthorizedControllerTest do
  alias Astoria.{Fixtures}
  import Mox
  use AstoriaWeb.ConnCase

  setup :verify_on_exit!

  describe "/github/authorized" do
    test "with successful installation", %{conn: conn} do
      HTTPoisonMock
      |> expect(:post, fn _path, _payload, _headers ->
        {:ok, Fixtures.Github.Api.Oauth.create()}
      end)
      |> expect(:get, fn _path, _headers ->
        {:ok, Fixtures.Github.Api.V3.User.get()}
      end)

      conn =
        get(
          conn,
          Routes.github_authorized_path(conn, :show),
          %{}
        )

      assert html_response(conn, 302)
      assert get_session(conn, "user_id")
    end
  end
end
