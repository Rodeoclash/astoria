defmodule Astoria.GithubRepositories.GithubPullRequestsTest do
  alias Astoria.{GithubRepositories.GithubPullRequests}
  import Astoria.Factory
  use Astoria.DataCase
  use Oban.Testing, repo: Astoria.Repo

  doctest GithubPullRequests

  test "sync/1" do
    github_installation = insert(:github_installation, %{id: 1})

    insert(
      :github_installation_authorization,
      %{github_installation: github_installation}
    )

    github_repository = insert(:github_repository, %{github_installation: github_installation})

    GithubPullRequests.sync(github_repository)

    assert_enqueued(worker: Astoria.Jobs.GithubSync.InstallationAuthorizedRequest)
  end

  test "sync/2" do
    github_installation = insert(:github_installation, %{id: 1})

    insert(
      :github_installation_authorization,
      %{github_installation: github_installation}
    )

    github_repository = insert(:github_repository, %{github_installation: github_installation})

    GithubPullRequests.sync(github_repository, 1)

    assert_enqueued(worker: Astoria.Jobs.GithubSync.InstallationAuthorizedRequest)
  end
end
