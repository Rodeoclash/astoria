defmodule Astoria.Jobs.GithubSync.RepositoryPullRequestsTest do
  alias Astoria.{Jobs.GithubSync.RepositoryPullRequests, Repo, Github, Utility, Fixtures}
  import Astoria.Factory
  import Mox
  use Astoria.DataCase
  use Oban.Testing, repo: Astoria.Repo

  doctest RepositoryPullRequests

  test "perform/1" do
    github_installation_authorization = insert(:github_installation_authorization)

    github_repository =
      insert(:github_repository, %{
        id: 1,
        github_installation: github_installation_authorization.github_installation
      })

    client = Github.Api.Client.new("1234", "token")

    request =
      Github.Api.V3.Repos.Pulls.read_list(client, github_repository.data["full_name"], %{
        state: "all"
      })

    encoded =
      %{request: request, github_repository_id: github_repository.id}
      |> Utility.serialise()

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

    assert :ok ==
             RepositoryPullRequests.perform(%Oban.Job{args: %{"encoded" => encoded}})

    assert_enqueued(
      worker: Astoria.Jobs.GithubSync.RepositoryPullRequests,
      args: %{
        "encoded" =>
          "g3QAAAACZAAUZ2l0aHViX3JlcG9zaXRvcnlfaWRhAWQAB3JlcXVlc3R0AAAABWQACl9fc3RydWN0X19kACRFbGl4aXIuQXN0b3JpYS5HaXRodWIuQXBpLlYzLlJlcXVlc3RkAAZjbGllbnR0AAAAA2QACl9fc3RydWN0X19kACBFbGl4aXIuQXN0b3JpYS5HaXRodWIuQXBpLkNsaWVudGQABXRva2VubQAAAAQxMjM0ZAAEdHlwZW0AAAAFdG9rZW5kAAZtZXRob2RkAANnZXRkAAdwYXlsb2FkdAAAAABkAAN1cmxtAAAARGh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vc2VhcmNoL2NvZGU/cT1hZGRDbGFzcyt1c2VyJTNBbW96aWxsYSZwYWdlPTE1"
      }
    )
  end
end
