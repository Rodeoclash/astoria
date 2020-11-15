defmodule Astoria.GithubRepositories.GithubPullRequestsTest do
  alias Astoria.{GithubRepositories.GithubPullRequests, Fixtures}
  import Astoria.Factory
  import Mox
  use Astoria.DataCase
  use Oban.Testing, repo: Astoria.Repo

  doctest GithubPullRequests

  setup :verify_on_exit!

  describe "sync/1" do
    test "getting list of pull requests" do
      github_repository =
        insert(:github_repository, %{
          id: 1
        })

      HTTPoisonMock
      |> expect(:post, fn _path, _payload, _headers ->
        {:ok, Fixtures.Github.Api.V3.App.Installations.AccessTokens.create()}
      end)

      GithubPullRequests.sync(github_repository)

      assert_enqueued(
        worker: Astoria.Interactions.SyncGithubRepositoryPullRequests,
        args: %{
          "encoded" =>
            "g3QAAAACZAAUZ2l0aHViX3JlcG9zaXRvcnlfaWRhAWQAB3JlcXVlc3R0AAAABWQACl9fc3RydWN0X19kACRFbGl4aXIuQXN0b3JpYS5HaXRodWIuQXBpLlYzLlJlcXVlc3RkAAZjbGllbnR0AAAAA2QACl9fc3RydWN0X19kACBFbGl4aXIuQXN0b3JpYS5HaXRodWIuQXBpLkNsaWVudGQABXRva2VubQAAACt2MS4zMjk5MGEwMGZmMmE0NjRkZmNjZDY2YmU4MWRlN2M0MTNlM2M2MGUxZAAEdHlwZW0AAAAFdG9rZW5kAAZtZXRob2RkAANnZXRkAAdwYXlsb2FkdAAAAABkAAN1cmxtAAAALWh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvL3B1bGxzP3N0YXRlPWFsbA=="
        }
      )
    end
  end
end
