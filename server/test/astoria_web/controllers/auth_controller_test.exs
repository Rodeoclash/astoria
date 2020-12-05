defmodule AstoriaWeb.AuthControllerTest do
  alias Astoria.{Repo}
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

    # TODO: Test existing user

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

    test "after post installation flow - github_user_id exists on provided installation", %{
      conn: conn
    } do
      github_installation = insert(:github_installation)

      assert_raise RuntimeError, fn ->
        conn
        |> Plug.Test.init_test_session(%{github_installation_id: github_installation.id})
        |> bypass_through(AstoriaWeb.Router, [:browser])
        |> get(Routes.auth_path(conn, :callback, :github))
        |> assign(:ueberauth_auth, @auth)
        |> AstoriaWeb.AuthController.callback(%{})
      end
    end

    test "after post installation flow", %{conn: conn} do
      github_installation =
        insert(:github_installation, %{
          github_user: nil
        })

      conn =
        conn
        |> Plug.Test.init_test_session(%{github_installation_id: github_installation.id})
        |> bypass_through(AstoriaWeb.Router, [:browser])
        |> get(Routes.auth_path(conn, :callback, :github))
        |> assign(:ueberauth_auth, @auth)
        |> AstoriaWeb.AuthController.callback(%{})

      github_installation = Repo.reload(github_installation)

      assert get_flash(conn, :info) ==
               "Hello John Doe, your app has been installed and you have been logged in"

      assert redirected_to(conn) == "/dashboard"
      assert github_installation.github_user_id
      assert get_session(conn, :current_user_id)

      assert_enqueued(worker: Astoria.Jobs.SyncGithubInstallation)
    end
  end
end
