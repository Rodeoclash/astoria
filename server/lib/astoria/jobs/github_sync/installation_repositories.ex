defmodule Astoria.Jobs.GithubSync.InstallationRepositories do
  alias Astoria.{
    Github,
    GithubRepositories,
    GithubInstallations,
    GithubInstallationAuthorizations,
    Repo,
    Jobs,
    Utility
  }

  use Oban.Worker, queue: :sync_github

  def perform(%Oban.Job{args: %{"encoded" => encoded}}) do
    %{request: request, github_installation_id: github_installation_id} =
      Utility.deserialise(encoded)

    github_installation =
      Repo.get(GithubInstallations.GithubInstallation, github_installation_id)
      |> Repo.preload(:github_installation_authorization)

    github_installation_authorization = github_installation.github_installation_authorization

    case Github.Api.V3.Request.perform(request) do
      {:ok, response} ->
        GithubInstallationAuthorizations.update_rate_limits(
          github_installation_authorization,
          response
        )

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
          |> Jobs.GithubSync.InstallationRepositories.new()
          |> Oban.insert()
        end
    end

    :ok
  end
end
