defmodule Astoria.Jobs.GithubSync.Installation do
  alias Astoria.{Github, GithubInstallations, Utility}
  use Oban.Worker, queue: :sync_github

  def perform(%Oban.Job{args: %{"encoded" => encoded}}) do
    %{request: request} = Utility.deserialise(encoded)

    case Github.Api.V3.Request.perform(request) do
      {:ok, response} ->
        case GithubInstallations.upsert_from_github_data(response.poison_response.body) do
          {:ok, github_installation} ->
            GithubInstallations.GithubRepositories.enqueue_github_installation_pull_requests_sync(
              github_installation
            )
        end
    end

    :ok
  end
end
