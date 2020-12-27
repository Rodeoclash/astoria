defmodule Astoria.Jobs.GithubSync.PullRequest do
  alias Astoria.{Github, GithubRepositories, Repo, Jobs, Utility}
  import Jobs.GithubSync
  use Oban.Worker, queue: :sync_github

  def perform(%Oban.Job{args: %{"encoded" => encoded}}) do
    %{request: request, github_repository_id: github_repository_id} = Utility.deserialise(encoded)

    github_repository =
      Repo.get(GithubRepositories.GithubRepository, github_repository_id)
      |> Repo.preload(:github_installation)

    github_installation = github_repository.github_installation

    case Github.Api.V3.Request.perform(request) do
      {:ok, response} ->
        update_github_installation_rate_limits(
          github_installation,
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
