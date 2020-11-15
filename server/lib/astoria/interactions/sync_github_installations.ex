defmodule Astoria.Interactions.SyncGithubInstallations do
  alias Astoria.{Github, GithubInstallations}

  def perform(request) do
    case Github.Api.V3.Request.perform(request) do
      {:ok, response} ->
        Enum.map(response.poison_response.body, fn installation ->
          case GithubInstallations.upsert(installation) do
            {:ok, github_installation} ->
              GithubInstallations.GithubRepositories.sync(github_installation)
          end
        end)

        if response.has_next_url? == true do
          request = %{request | url: response.next_url}
          perform(request)
        end
    end
  end
end
