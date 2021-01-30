defmodule AstoriaWeb.AuthControllerTest do
  alias Astoria.{Repo, UserGithubInstallations}
  import Astoria.Factory
  use AstoriaWeb.ConnCase
  use Oban.Testing, repo: Astoria.Repo

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
    test "with regular auth, new user", %{conn: conn} do
      conn =
        conn
        |> bypass_through(AstoriaWeb.Router, [:browser])
        |> get(Routes.auth_path(conn, :callback, :github))
        |> assign(:ueberauth_auth, @auth)
        |> AstoriaWeb.AuthController.callback(%{})

      assert get_flash(conn, :info) == "Hello John Doe, you have been logged in"
      assert redirected_to(conn) == "/dashboard"
      assert get_session(conn, :current_user_id)
    end

    test "with regular auth, existing user", %{conn: conn} do
      user =
        insert(:user, %{
          email: "john.doe@example.com"
        })

      conn =
        conn
        |> bypass_through(AstoriaWeb.Router, [:browser])
        |> get(Routes.auth_path(conn, :callback, :github))
        |> assign(:ueberauth_auth, @auth)
        |> AstoriaWeb.AuthController.callback(%{})

      assert get_flash(conn, :info) == "Hello John Doe, you have been logged in"
      assert redirected_to(conn) == "/dashboard"
      assert get_session(conn, :current_user_id) == user.id
    end

    test "after post installation flow - installation id given but not found", %{conn: conn} do
      assert_raise RuntimeError, fn ->
        conn
        |> Plug.Test.init_test_session(%{github_installation_id: -1})
        |> bypass_through(AstoriaWeb.Router, [:browser])
        |> get(Routes.auth_path(conn, :callback, :github))
        |> assign(:ueberauth_auth, @auth)
        |> AstoriaWeb.AuthController.callback(%{})
      end
    end

    test "after post installation flow - user already belongs to provided installation", %{
      conn: conn
    } do
      user_github_installation = insert(:user_github_installation)

      assert_raise RuntimeError, fn ->
        conn
        |> Plug.Test.init_test_session(%{
          github_installation_id: user_github_installation.github_installation.id
        })
        |> bypass_through(AstoriaWeb.Router, [:browser])
        |> get(Routes.auth_path(conn, :callback, :github))
        |> assign(:ueberauth_auth, @auth)
        |> AstoriaWeb.AuthController.callback(%{})
      end
    end

    test "after post installation flow", %{conn: conn} do
      github_installation = insert(:github_installation)

      conn =
        conn
        |> Plug.Test.init_test_session(%{github_installation_id: github_installation.id})
        |> bypass_through(AstoriaWeb.Router, [:browser])
        |> get(Routes.auth_path(conn, :callback, :github))
        |> assign(:ueberauth_auth, @auth)
        |> AstoriaWeb.AuthController.callback(%{})

      assert get_flash(conn, :info) ==
               "Hello John Doe, your app has been installed and you have been logged in"

      assert redirected_to(conn) == "/dashboard"

      assert Repo.get_by(UserGithubInstallations.UserGithubInstallation, %{
               github_installation_id: github_installation.id
             })

      assert get_session(conn, :current_user_id)

      assert_enqueued(worker: Astoria.Jobs.GithubSync.Installation)
    end

    test "with missing name", %{conn: conn} do
      auth = %Ueberauth.Auth{
        provider: :github,
        extra: %Ueberauth.Auth.Extra{
          raw_info: %{
            user: %{
              "id" => 63807
            }
          }
        },
        info: %{
          name: nil,
          email: "john.doe@example.com"
        }
      }

      conn =
        conn
        |> bypass_through(AstoriaWeb.Router, [:browser])
        |> get(Routes.auth_path(conn, :callback, :github))
        |> assign(:ueberauth_auth, auth)
        |> AstoriaWeb.AuthController.callback(%{})

      assert get_flash(conn, :info) == "Hello john.doe, you have been logged in"
      assert redirected_to(conn) == "/dashboard"
      assert get_session(conn, :current_user_id)
    end
  end
end
