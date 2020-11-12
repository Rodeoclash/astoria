defmodule Astoria.Interactions.SyncGithubInstallations do
  alias Astoria.{Github, GithubInstallations}

  def perform(request) do
    case Github.Api.V3.Request.perform(request) do
      {:ok, response} ->
        Enum.map(response.poison_response.body, fn installation ->
          with {:ok, github_installation} <- GithubInstallations.upsert(installation),
               do: GithubInstallations.GithubRepositories.sync(github_installation)
        end)
    end
  end
end
