defmodule Astoria.Interactions.SyncGithubRepositoryPullRequests do
  alias Astoria.{Github, GithubRepositories, GithubPullRequests, Repo}

  def perform(request, github_repository_id) do
    github_repository = Repo.get(GithubRepositories.GithubRepository, github_repository_id)

    with {:ok, response} <- Github.Api.V3.Request.perform(request),
         do:
           Enum.map(response.data.body, fn pull_request ->
             GithubPullRequests.upsert(github_repository, pull_request)
           end)
  end
end
