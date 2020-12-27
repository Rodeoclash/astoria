defmodule Astoria.Jobs.GithubSync.PullRequestTest do
  alias Astoria.{Jobs.GithubSync.PullRequest, Repo, Github, Utility, Fixtures}
  import Astoria.Factory
  import Mox
  use Astoria.DataCase
  use Oban.Testing, repo: Astoria.Repo

  doctest PullRequest

  test "perform/1" do
    github_repository =
      insert(:github_repository, %{
        id: 1
      })

    client = Github.Api.Client.new("1234", "token")

    request =
      Github.Api.V3.Repos.Pulls.read_single(
        client,
        github_repository.data["full_name"],
        1
      )

    encoded =
      %{request: request, github_repository_id: github_repository.id}
      |> Utility.serialise()

    HTTPoisonMock
    |> expect(:post, fn _path, _payload, _headers ->
      {:ok, Fixtures.Github.Api.V3.App.Installations.AccessTokens.create()}
    end)
    |> expect(:get, fn _path, _headers ->
      {:ok, Fixtures.Github.Api.V3.Repos.Pulls.read_single()}
    end)

    assert :ok == PullRequest.perform(%Oban.Job{args: %{"encoded" => encoded}})
  end
end
