defmodule Astoria.Jobs.GithubSync.PullRequest do
  alias Astoria.{Github, GithubRepositories, GithubInstallationAuthorizations, Repo, Utility}
  use Oban.Worker, queue: :sync_github

  def perform(%Oban.Job{args: %{"encoded" => encoded}}) do
    %{request: request, github_repository_id: github_repository_id} = Utility.deserialise(encoded)

    github_repository =
      Repo.get(GithubRepositories.GithubRepository, github_repository_id)
      |> Repo.preload(:github_installation)
      |> Repo.preload(:github_installation_authorization)

    github_installation_authorization =
      github_repository.github_installation.github_installation_authorization

    case Github.Api.V3.Request.perform(request) do
      {:ok, response} ->
        GithubInstallationAuthorizations.update_rate_limits(
          github_installation_authorization,
          response
        )

        GithubRepositories.GithubPullRequests.upsert(
          github_repository,
          response.poison_response.body
        )
    end

    :ok
  end
end
