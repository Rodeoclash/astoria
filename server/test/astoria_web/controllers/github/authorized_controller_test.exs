defmodule AstoriaWeb.Github.AuthorizedControllerTest do
  import Mox
  use AstoriaWeb.ConnCase

  setup :verify_on_exit!

  describe "/github/authorized" do
    test "with successful installation", %{conn: conn} do
      HTTPoisonMock
      |> expect(:post, fn _path, _payload, _headers ->
        {:ok,
         %HTTPoison.Response{
           body:
             "access_token=abc&expires_in=28800&refresh_token=abc&refresh_token_expires_in=15811200&scope=&token_type=bearer"
         }}
      end)
      |> expect(:post, fn _path, _payload, _headers ->
        {:ok,
         %HTTPoison.Response{
           body:
             "{\"data\":{\"viewer\":{\"name\":\"Louis Toadvine\", \"email\":\"email@example.com\"}}}"
         }}
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
