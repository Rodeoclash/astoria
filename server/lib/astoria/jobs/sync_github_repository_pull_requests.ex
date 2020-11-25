defmodule Astoria.Jobs.SyncGithubRepositoryPullRequests do
  alias Astoria.{Github, GithubRepositories, Repo, Jobs, Utility}
  import Jobs.SyncGithub
  use Oban.Worker, queue: :sync_github

  # def perform(request, github_repository_id) do
  def perform(%Oban.Job{args: %{"encoded" => encoded}}) do
    %{request: request, github_repository_id: github_repository_id} = Utility.deserialise(encoded)

    github_repository =
      Repo.get(GithubRepositories.GithubRepository, github_repository_id)
      |> Repo.preload(:github_installation)

    case Github.Api.V3.Request.perform(request) do
      {:ok, response} ->
        update_github_installation_rate_limits(github_repository.github_installation, response)

        Enum.map(response.poison_response.body, fn pull_request ->
          GithubRepositories.GithubPullRequests.sync(github_repository, pull_request["number"])
        end)

        if response.has_next_url? == true do
          encoded =
            %{
              request: %{request | url: response.next_url},
              github_repository_id: github_repository_id
            }
            |> Utility.serialise()

          %{encoded: encoded}
          |> Jobs.SyncGithubRepositoryPullRequests.new()
          |> Oban.insert()
        end
    end

    :ok
  end
end
