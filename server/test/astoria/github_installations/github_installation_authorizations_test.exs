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

  test "upsert/1" do
    github_installation = insert(:github_installation)

    HTTPoisonMock
    |> expect(:post, fn _path, _payload, _headers ->
      {:ok, Fixtures.Github.Api.V3.App.Installations.AccessTokens.create()}
    end)
    |> expect(:post, fn _path, _payload, _headers ->
      {:ok, Fixtures.Github.Api.V3.App.Installations.AccessTokens.create()}
    end)

    GithubInstallationAuthorizations.upsert(github_installation)

    assert {:ok, github_installation_authorization} =
             GithubInstallationAuthorizations.upsert(github_installation)

    assert github_installation.id == github_installation_authorization.github_installation_id

    assert github_installation_authorization.token ==
             "v1.32990a00ff2a464dfccd66be81de7c413e3c60e1"
  end
end
