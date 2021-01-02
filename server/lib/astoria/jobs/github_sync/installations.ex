defmodule Astoria.Jobs.GithubSync.Installations do
  alias Astoria.{Github, GithubInstallations, Utility}
  use Oban.Worker, queue: :sync_github

  def perform(%Oban.Job{args: %{"encoded" => encoded}}) do
    %{request: request} = Utility.deserialise(encoded)

    case Github.Api.V3.Request.perform(request) do
      {:ok, response} ->
        Enum.map(response.poison_response.body, fn installation ->
          case GithubInstallations.upsert_from_github_data(installation) do
            {:ok, github_installation} ->
              GithubInstallations.GithubRepositories.enqueue_github_installation_pull_requests_sync(
                github_installation
              )
          end
        end)

        if response.has_next_url? == true do
          request = %{request | url: response.next_url}
          perform(request)
        end
    end

    :ok
  end
end
