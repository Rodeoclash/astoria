defmodule AstoriaWeb.AuthControllerTest do
  use AstoriaWeb.ConnCase

  describe "GET /auth/github/callback" do
    test "with successful signup", %{conn: conn} do
      auth = %Ueberauth.Auth{
        provider: :github,
        extra: %Ueberauth.Auth.Extra{
          raw_info: %{
            user: %{
              "id" => 63807,
            }
          }
        },
        info: %{
          name: "John Doe",
          email: "john.doe@example.com"
        }
      }

      conn = conn
      |> bypass_through(AstoriaWeb.Router, [:browser])
      |> get(Routes.auth_path(conn, :callback, :github))
      |> assign(:ueberauth_auth, auth)
      |> AstoriaWeb.AuthController.callback(%{})

      assert get_flash(conn, :info) == "Hello John Doe, you have been logged in"
      assert redirected_to(conn) == "/dashboard"
    end
  end
end
