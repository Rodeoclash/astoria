defmodule Astoria.GithubRepositories.GithubPullRequestsTest do
  alias Astoria.{GithubRepositories.GithubPullRequests, Fixtures}

  import Astoria.Factory
  import Mox

  use Astoria.DataCase

  doctest GithubPullRequests

  setup :verify_on_exit!

  test "sync/0" do
    github_repository = insert(:github_repository)

    HTTPoisonMock
    |> expect(:post, fn _path, _payload, _headers ->
      {:ok, Fixtures.Github.Api.V3.App.Installations.AccessTokens.create()}
    end)
    |> expect(:get, fn _path, _headers ->
      {:ok, Fixtures.Github.Api.V3.Repos.Pulls.read_list()}
    end)
    |> expect(:get, fn _path, _headers ->
      {:ok, Fixtures.Github.Api.V3.Repos.Pulls.read_single()}
    end)

    GithubPullRequests.sync(github_repository)

    assert Astoria.GithubRepositories.count() == 1
  end
end
