defmodule Astoria.Interactions.SyncGithubInstallations do
  alias Astoria.{Github, GithubInstallations}

  def perform(request) do
    with {:ok, response} <- Github.Api.V3.Request.perform(request),
         do:
           Enum.map(response.data.body, fn installation ->
             with {:ok, github_installation} <- GithubInstallations.upsert(installation),
                  do: GithubInstallations.GithubRepositories.sync(github_installation)
           end)
  end
end
