defmodule Astoria.GithubRepositories.GithubPullRequests do
  alias Astoria.{
    Github,
    GithubInstallations,
    GithubPullRequests,
    GithubRepositories,
    Jobs,
    Repo
  }

  @doc """
  Trigger a sync of all repositories for this installation
  """
  @spec enqueue_github_repository_pull_requests_sync(%GithubRepositories.GithubRepository{}) ::
          %Oban.Job{}
  def enqueue_github_repository_pull_requests_sync(github_repository) do
    github_repository = Repo.preload(github_repository, :github_installation)

    github_installation = github_repository.github_installation

    case GithubInstallations.client(github_installation) do
      {:ok, client} ->
        request =
          Github.Api.V3.Repos.Pulls.read_list(client, github_repository.data["full_name"], %{
            state: "all"
          })

        payload = %{
          callback: &handle_github_repository_pull_requests_response/2,
          github_installation_id: github_installation.id,
          github_repository_id: github_repository.id,
          request: request
        }

        Jobs.GithubSync.InstallationAuthorizedRequest.enqueue(
          github_installation,
          payload
        )
    end
  end

  @doc """
  Launches a sync to fetch details for each pull request that was found
  """
  def handle_github_repository_pull_requests_response(
        %{github_repository_id: github_repository_id},
        response
      ) do
    {:ok, github_repository} =
      Repo.get(GithubRepositories.GithubRepository, github_repository_id)
      |> GithubRepositories.indicate_activity()

    Enum.map(response.poison_response.body, fn pull_request ->
      GithubRepositories.GithubPullRequests.enqueue_github_repository_pull_request_sync(
        github_repository,
        pull_request["number"]
      )
    end)
  end

  @doc """
  Trigger a sync of a single pull request
  """
  @spec enqueue_github_repository_pull_request_sync(
          %GithubRepositories.GithubRepository{},
          Integer.t()
        ) :: :ok
  def enqueue_github_repository_pull_request_sync(github_repository, github_pull_request_id) do
    github_repository = Repo.preload(github_repository, :github_installation)

    github_installation = github_repository.github_installation

    case GithubInstallations.client(github_installation) do
      {:ok, client} ->
        request =
          Github.Api.V3.Repos.Pulls.read_single(
            client,
            github_repository.data["full_name"],
            github_pull_request_id
          )

        payload = %{
          callback: &handle_github_repository_pull_request_response/2,
          github_installation_id: github_installation.id,
          github_repository_id: github_repository.id,
          request: request
        }

        Jobs.GithubSync.InstallationAuthorizedRequest.enqueue(
          github_installation,
          payload
        )
    end
  end

  @doc """
  Update the pull request with its full details
  """
  def handle_github_repository_pull_request_response(
        %{github_repository_id: github_repository_id},
        response
      ) do
    {:ok, github_repository} =
      Repo.get(GithubRepositories.GithubRepository, github_repository_id)
      |> GithubRepositories.indicate_activity()

    GithubRepositories.GithubPullRequests.upsert(
      github_repository,
      response.poison_response.body
    )
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
