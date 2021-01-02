defmodule Astoria.GithubRepositories.GithubPullRequestsTest do
  alias Astoria.{GithubRepositories.GithubPullRequests, Github, Fixtures}
  import Astoria.Factory
  import Mox
  use Astoria.DataCase
  use Oban.Testing, repo: Astoria.Repo

  doctest GithubPullRequests

  setup :verify_on_exit!

  test "enqueue_github_repository_pull_requests_sync/1" do
    github_installation = insert(:github_installation, %{id: 1})

    insert(
      :github_installation_authorization,
      %{github_installation: github_installation}
    )

    github_repository = insert(:github_repository, %{github_installation: github_installation})

    GithubPullRequests.enqueue_github_repository_pull_requests_sync(github_repository)

    assert_enqueued(worker: Astoria.Jobs.GithubSync.InstallationAuthorizedRequest)
  end

  test "handle_github_repository_pull_requests_response/1" do
    github_repository = insert(:github_repository)

    payload = %{
      github_repository_id: github_repository.id
    }

    response = %Github.Api.V3.Response{
      poison_response: %HTTPoison.Response{
        body: [
          %{"number" => 4}
        ]
      },
      rate_limit_remaining: nil,
      rate_limit_resets_at: nil,
      has_rate_limit?: false,
      has_next_url?: false,
      next_url: nil,
      successful?: false
    }

    HTTPoisonMock
    |> expect(:post, fn _path, _payload, _headers ->
      {:ok, Fixtures.Github.Api.V3.App.Installations.AccessTokens.create()}
    end)

    assert [ok: %Oban.Job{}] =
             GithubPullRequests.handle_github_repository_pull_requests_response(payload, response)

    assert_enqueued(worker: Astoria.Jobs.GithubSync.InstallationAuthorizedRequest)
  end

  test "enqueue_github_repository_pull_request_sync/2" do
    github_installation = insert(:github_installation, %{id: 1})

    insert(
      :github_installation_authorization,
      %{github_installation: github_installation}
    )

    github_repository = insert(:github_repository, %{github_installation: github_installation})

    GithubPullRequests.enqueue_github_repository_pull_request_sync(github_repository, 1)

    assert_enqueued(worker: Astoria.Jobs.GithubSync.InstallationAuthorizedRequest)
  end

  test "handle_github_repository_pull_request_response/1" do
    github_repository = insert(:github_repository)

    payload = %{
      github_repository_id: github_repository.id
    }

    body = %{
      "id" => 1234
    }

    response = %Github.Api.V3.Response{
      poison_response: %HTTPoison.Response{
        body: body
      },
      rate_limit_remaining: nil,
      rate_limit_resets_at: nil,
      has_rate_limit?: false,
      has_next_url?: false,
      next_url: nil,
      successful?: false
    }

    assert {:ok, github_pull_request} =
             GithubPullRequests.handle_github_repository_pull_request_response(payload, response)

    assert github_pull_request.data == body
  end
end
