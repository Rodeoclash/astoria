defmodule AstoriaWeb.AuthControllerTest do
  alias Astoria.{Repo}
  import Astoria.Factory
  use AstoriaWeb.ConnCase

  @auth %Ueberauth.Auth{
    provider: :github,
    extra: %Ueberauth.Auth.Extra{
      raw_info: %{
        user: %{
          "id" => 63807
        }
      }
    },
    info: %{
      name: "John Doe",
      email: "john.doe@example.com"
    }
  }

  describe "GET /auth/github/callback" do
    test "with update of installation", %{conn: conn} do
      conn =
        conn
        |> bypass_through(AstoriaWeb.Router, [:browser])
        |> get(Routes.auth_path(conn, :callback, :github))
        |> assign(:ueberauth_auth, @auth)
        |> AstoriaWeb.AuthController.callback(%{})

      assert get_flash(conn, :info) == "Hello John Doe, you have been logged in"
      assert redirected_to(conn) == "/dashboard"
    end

    test "after post installation flow", %{conn: conn} do
      github_installation_id = "123"

      github_installation =
        insert(:github_installation, %{
          data: %{
            id: github_installation_id
          },
          github_user_id: nil
        })

      conn =
        conn
        |> Plug.Test.init_test_session(%{github_installation_id: github_installation_id})
        |> bypass_through(AstoriaWeb.Router, [:browser])
        |> get(Routes.auth_path(conn, :callback, :github))
        |> assign(:ueberauth_auth, @auth)
        |> AstoriaWeb.AuthController.callback(%{})

      github_installation = Repo.reload(github_installation)

      assert get_flash(conn, :info) == "Hello John Doe, you have been logged in"
      assert redirected_to(conn) == "/dashboard"
      assert github_installation.github_user_id
    end
  end
end
