defmodule Astoria.Interactions.SyncGithubRepositoryPullRequests do
  alias Astoria.{Github, GithubRepositories, Repo, Interactions}

  import Interactions.SyncGithub

  def perform(request, github_repository_id) do
    github_repository =
      Repo.get(GithubRepositories.GithubRepository, github_repository_id)
      |> Repo.preload(:github_installation)

    case Github.Api.V3.Request.perform(request) do
      {:ok, response} ->
        update_github_installation_rate_limits(github_repository.github_installation, response)

        if response.successful? == true do
          Enum.map(response.poison_response.body, fn pull_request ->
            #GithubRepositories.GithubPullRequests.sync(github_repository, pull_request["number"])
          end)
        end

        IO.inspect "=== checking for more pull requests"
        IO.inspect response
        if response.has_next_url? == true do
          IO.inspect response.next_url
          request = %{request | path: response.next_url}
          perform(request, github_repository_id)
        end
    end
  end
end
