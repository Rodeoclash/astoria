defmodule Astoria.Interactions.SyncGithubPullRequest do
  alias Astoria.{Github, GithubRepositories, Repo, Interactions}

  import Interactions.SyncGithub

  def perform(request, github_repository_id) do
    github_repository =
      Repo.get(GithubRepositories.GithubRepository, github_repository_id)
      |> Repo.preload(:github_installation)

    case Github.Api.V3.Request.perform(request) do
      {:ok, response} ->
        update_github_installation_rate_limits(
          github_repository.github_installation,
          response.data
        )

        GithubRepositories.GithubPullRequests.upsert(github_repository, response.data.body)
    end
  end
end
