defmodule Astoria.GithubInstallations.GithubInstallationAuthorizationsTest do
  alias Astoria.{GithubInstallations.GithubInstallationAuthorizations, Fixtures}

  import Astoria.Factory
  import Mox

  use Astoria.DataCase

  doctest GithubInstallationAuthorizations

  setup :verify_on_exit!

  describe "get/1" do
    test "when missing" do
      github_installation = insert(:github_installation)

      HTTPoisonMock
      |> expect(:post, fn _path, _payload, _headers ->
        {:ok, Fixtures.Github.Api.V3.App.Installations.AccessTokens.create()}
      end)

      assert {:ok, github_installation_authorization} =
               GithubInstallationAuthorizations.get(github_installation)

      assert github_installation_authorization.github_installation_id == github_installation.id
    end

    test "when expired" do
      github_installation_authorization =
        insert(:github_installation_authorization, %{
          expires_at: ~U[2014-10-02 00:29:10Z]
        })

      github_installation = github_installation_authorization.github_installation

      HTTPoisonMock
      |> expect(:post, fn _path, _payload, _headers ->
        {:ok, Fixtures.Github.Api.V3.App.Installations.AccessTokens.create()}
      end)

      assert {:ok, github_installation_authorization} =
               GithubInstallationAuthorizations.get(github_installation)

      assert github_installation_authorization.github_installation_id == github_installation.id
    end

    test "when not expired" do
      github_installation_authorization =
        insert(:github_installation_authorization, %{
          expires_at: ~U[3014-10-02 00:29:10Z]
        })

      github_installation = github_installation_authorization.github_installation

      assert {:ok, github_installation_authorization} =
               GithubInstallationAuthorizations.get(github_installation)

      assert github_installation_authorization.github_installation_id == github_installation.id
    end
  end

  test "missing?/1" do
    github_installation =
      insert(:github_installation)
      |> Repo.preload(:github_installation_authorization)

    assert GithubInstallationAuthorizations.missing?(github_installation)
  end

  test "create/1" do
    github_installation = insert(:github_installation)

    HTTPoisonMock
    |> expect(:post, fn _path, _payload, _headers ->
      {:ok, Fixtures.Github.Api.V3.App.Installations.AccessTokens.create()}
    end)

    assert {:ok, response} = GithubInstallationAuthorizations.create(github_installation)
    assert response.poison_response.body["token"] == "v1.32990a00ff2a464dfccd66be81de7c413e3c60e1"
  end

  test "upsert/1" do
    github_installation = insert(:github_installation)
    token = "token"

    assert {:ok, github_installation_authorization} =
             GithubInstallationAuthorizations.upsert(github_installation, %{
               "expires_at" => NaiveDateTime.utc_now(),
               "token" => token
             })

    assert github_installation_authorization.github_installation_id == github_installation.id
    assert github_installation_authorization.token == token
  end
end
