defmodule Astoria.Interactions.SyncGithubRepositoryPullRequests do
  alias Astoria.{Github, GithubRepositories, Repo}

  def perform(request, github_repository_id) do
    github_repository = Repo.get(GithubRepositories.GithubRepository, github_repository_id)

    with {:ok, response} <- Github.Api.V3.Request.perform(request),
         do:
           Enum.map(response.poison_response.body, fn pull_request ->
             GithubRepositories.GithubPullRequests.sync(github_repository, pull_request["number"])
           end)
  end
end
