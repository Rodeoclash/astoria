defmodule Astoria.GithubRepositories.GithubPullRequests do
  alias Astoria.{
    GithubInstallations,
    GithubRepositories,
    GithubPullRequests,
    Github,
    Interactions,
    Repo,
    Utility
  }

  @doc """
  Trigger a sync of all repositories for this installation
  """
  @spec sync(%GithubRepositories.GithubRepository{}) :: :ok
  def sync(github_repository) do
    github_repository = Repo.preload(github_repository, :github_installation)

    case GithubInstallations.client(github_repository.github_installation) do
      {:ok, client} ->
        request =
          Github.Api.V3.Repos.Pulls.read_list(client, github_repository.data["full_name"], %{
            state: "all"
          })

        encoded =
          %{request: request, github_repository_id: github_repository.id}
          |> Utility.serialise()

        %{encoded: encoded}
        |> Interactions.SyncGithubRepositoryPullRequests.new()
        |> Oban.insert()
    end
  end

  @doc """
  Trigger a sync of a single pull request
  """
  @spec sync(%GithubRepositories.GithubRepository{}, Integer.t()) :: :ok
  def sync(github_repository, github_pull_request_id) do
    github_repository = Repo.preload(github_repository, :github_installation)

    with {:ok, client} <- GithubInstallations.client(github_repository.github_installation),
         do:
           Github.Api.V3.Repos.Pulls.read_single(
             client,
             github_repository.data["full_name"],
             github_pull_request_id
           )
           |> Interactions.SyncGithubPullRequest.perform(github_repository.id)
  end

  @doc """
  Insert data about the pull request. Will update if matches github_id.
  """
  @spec upsert(%GithubRepositories.GithubRepository{}, map()) :: :ok
  def upsert(github_repository, data) do
    %GithubPullRequests.GithubPullRequest{}
    |> GithubPullRequests.GithubPullRequest.changeset(%{
      data: data,
      github_id: data["id"],
      github_repository_id: github_repository.id
    })
    |> Repo.insert(
      on_conflict: {:replace_all_except, [:id, :pub_id]},
      conflict_target: :github_id
    )
  end
end
