defmodule Astoria.Interactions.SyncGithubPullRequest do
  alias Astoria.{Github, GithubRepositories, Repo}

  def perform(request, github_repository_id) do
    github_repository = Repo.get(GithubRepositories.GithubRepository, github_repository_id)

    with {:ok, response} <- Github.Api.V3.Request.perform(request),
         do: GithubRepositories.GithubPullRequests.upsert(github_repository, response.data.body)
  end
end
