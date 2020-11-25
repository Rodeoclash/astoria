defmodule Astoria.Jobs.SyncGithubInstallationRepositories do
  alias Astoria.{Github, GithubRepositories, GithubInstallations, Repo, Jobs, Utility}
  import Jobs.SyncGithub
  use Oban.Worker, queue: :sync_github

  def perform(%Oban.Job{args: %{"encoded" => encoded}}) do
    %{request: request, github_installation_id: github_installation_id} =
      Utility.deserialise(encoded)

    github_installation = Repo.get(GithubInstallations.GithubInstallation, github_installation_id)

    case Github.Api.V3.Request.perform(request) do
      {:ok, response} ->
        update_github_installation_rate_limits(github_installation, response)

        Enum.map(response.poison_response.body["repositories"], fn repository ->
          case GithubRepositories.upsert(github_installation, repository) do
            {:ok, github_repository} ->
              GithubRepositories.GithubPullRequests.sync(github_repository)
          end
        end)

        if response.has_next_url? == true do
          encoded =
            %{
              request: %{request | url: response.next_url},
              github_installation_id: github_installation_id
            }
            |> Utility.serialise()

          %{encoded: encoded}
          |> Jobs.SyncGithubInstallationRepositories.new()
          |> Oban.insert()
        end
    end

    :ok
  end
end
