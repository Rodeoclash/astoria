defmodule Astoria.Interactions.SyncGithubInstallationRepositories do
  alias Astoria.{Github, GithubRepositories, GithubInstallations, Repo}

  def perform(request, github_installation_id) do
    github_installation = Repo.get(GithubInstallations.GithubInstallation, github_installation_id)

    with {:ok, response} <- Github.Api.V3.Request.perform(request),
         do:
           Enum.each(response.data.body["repositories"], fn repository ->
             GithubRepositories.upsert(github_installation, repository)
           end)

    :ok
  end
end
