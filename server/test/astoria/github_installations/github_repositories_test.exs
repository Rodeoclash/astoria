defmodule Astoria.GithubInstallations.GithubRepositoriesTest do
  alias Astoria.{GithubInstallations.GithubRepositories, Fixtures}

  import Astoria.Factory
  import Mox

  use Astoria.DataCase

  doctest GithubRepositories

  setup :verify_on_exit!

  test "sync/0" do
    github_installation = insert(:github_installation)

    HTTPoisonMock
    |> expect(:post, fn _path, _payload, _headers ->
      {:ok, Fixtures.Github.Api.V3.App.Installations.AccessTokens.create()}
    end)
    |> expect(:get, fn _path, _headers ->
      {:ok, Fixtures.Github.Api.V3.Installation.Repositories.read()}
    end)
    |> expect(:get, fn _path, _headers ->
      {:ok, Fixtures.Github.Api.V3.Repos.Pulls.read_list()}
    end)
    |> expect(:get, fn _path, _headers ->
      {:ok, Fixtures.Github.Api.V3.Repos.Pulls.read_single()}
    end)

    GithubRepositories.sync(github_installation)

    assert Astoria.GithubRepositories.count() == 1
  end
end
