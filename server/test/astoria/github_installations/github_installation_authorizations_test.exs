defmodule Astoria.GithubInstallations.GithubInstallationAuthorizationsTest do
  alias Astoria.{GithubInstallations.GithubInstallationAuthorizations, Fixtures}

  import Astoria.Factory
  import Mox

  use Astoria.DataCase

  doctest GithubInstallationAuthorizations

  setup :verify_on_exit!

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

    assert {:ok, github_installation_authorization} =
             GithubInstallationAuthorizations.create(github_installation)

    assert github_installation.id == github_installation_authorization.github_installation_id
    assert github_installation_authorization.token == "v1.32990a00ff2a464dfccd66be81de7c413e3c60e1"
  end

  test "refresh/1" do
    github_installation = insert(:github_installation_authorization).github_installation
      |> Repo.preload(:github_installation_authorization)

    HTTPoisonMock
    |> expect(:post, fn _path, _payload, _headers ->
      {:ok, Fixtures.Github.Api.V3.App.Installations.AccessTokens.create()}
    end)

    assert {:ok, github_installation_authorization} =
             GithubInstallationAuthorizations.refresh(github_installation)

    assert github_installation.id == github_installation_authorization.github_installation_id
    assert github_installation_authorization.token == "v1.32990a00ff2a464dfccd66be81de7c413e3c60e1"
  end
end
