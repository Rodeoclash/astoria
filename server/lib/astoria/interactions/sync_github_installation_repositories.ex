defmodule Astoria.Interactions.SyncGithubInstallationRepositories do
  alias Astoria.{Github, GithubRepositories, GithubInstallations, Repo, Interactions}

  import Interactions.SyncGithub

  def perform(request, github_installation_id) do
    github_installation = Repo.get(GithubInstallations.GithubInstallation, github_installation_id)

    case Github.Api.V3.Request.perform(request) do
      {:ok, response} ->
        update_github_installation_rate_limits(github_installation, response)

        Enum.map(response.poison_response.body["repositories"], fn repository ->
          with {:ok, github_repository} <-
                 GithubRepositories.upsert(github_installation, repository),
               do: GithubRepositories.GithubPullRequests.sync(github_repository)
        end)
    end
  end
end
