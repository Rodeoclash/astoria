defmodule AstoriaWeb.Github.WebhookControllerTest do
  alias Astoria.{Fixtures.Github.Webhooks, GithubInstallations, Fixtures}
  import Astoria.Factory
  import Mox
  use AstoriaWeb.ConnCase

  setup %{conn: conn} do
    Mox.verify_on_exit!()

    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "/api/github/webhook" do
    test "app created ping", %{conn: conn} do
      conn =
        post(
          conn,
          Routes.api_github_webhook_path(conn, :create),
          Webhooks.Ping.app_created()
        )

      assert response(conn, 204)
    end

    test "app install created", %{conn: conn} do
      HTTPoisonMock
      |> expect(:post, fn _path, _payload, _headers ->
        {:ok, Fixtures.Github.Api.V3.App.Installations.AccessTokens.create()}
      end)

      conn =
        post(
          conn,
          Routes.api_github_webhook_path(conn, :create),
          Webhooks.Installation.created()
        )

      assert GithubInstallations.count() == 1

      assert response(conn, 204)
    end

    test "app install deleted", %{conn: conn} do
      response = Webhooks.Installation.deleted()

      insert(:github_installation, %{
        github_id: response["installation"]["id"]
      })

      conn =
        post(
          conn,
          Routes.api_github_webhook_path(conn, :create),
          response
        )

      assert GithubInstallations.count() == 0

      assert response(conn, 204)
    end

    test "unknown event", %{conn: conn} do
      conn = post(conn, Routes.api_github_webhook_path(conn, :create), %{"unknown" => "event"})

      assert response(conn, 204)
    end
  end
end
