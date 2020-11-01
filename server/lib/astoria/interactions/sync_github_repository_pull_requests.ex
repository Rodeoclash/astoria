defmodule Astoria.Interactions.SyncGithubRepositoryPullRequests do
  alias Astoria.{Github, GithubRepositories, Repo}

  def perform(request, github_repository_id) do
    github_repository = Repo.get(GithubRepositories.GithubRepository, github_repository_id)
    Github.Api.V3.Request.perform(request)

    # with {:ok, response} <- Github.Api.V3.Request.perform(request),
    #     do:
    #       Enum.each(response.data.body["repositories"], fn repository ->
    #         GithubRepositories.upsert(github_installation, repository)
    #       end)

    # :ok
  end
end
