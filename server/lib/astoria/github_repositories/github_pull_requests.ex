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
  @spec sync(%GithubRepositories.GithubRepository{}) :: :ok
  def sync(github_repository) do
    github_repository =
      Repo.preload(github_repository, github_installation: :github_installation_authorization)

    case GithubInstallations.client(github_repository.github_installation) do
      {:ok, client} ->
        github_installation_authorization =
          github_repository.github_installation.github_installation_authorization

        request =
          Github.Api.V3.Repos.Pulls.read_list(client, github_repository.data["full_name"], %{
            state: "all"
          })

        payload = %{
          callback: &sync_callback_repository_pull_requests/2,
          github_installation_authorization_id: github_installation_authorization.id,
          github_repository_id: github_repository.id,
          request: request
        }

        Jobs.GithubSync.InstallationAuthorizedRequest.enqueue(
          github_installation_authorization,
          payload
        )
    end
  end

  @doc """
  Launches a sync to fetch details for each pull request that was found
  """
  def sync_callback_repository_pull_requests(
        %{github_repository_id: github_repository_id},
        response
      ) do
    github_repository = Repo.get(GithubRepositories.GithubRepository, github_repository_id)

    Enum.map(response.poison_response.body, fn pull_request ->
      GithubRepositories.GithubPullRequests.sync(github_repository, pull_request["number"])
    end)
  end

  @doc """
  Trigger a sync of a single pull request
  """
  @spec sync(%GithubRepositories.GithubRepository{}, Integer.t()) :: :ok
  def sync(github_repository, github_pull_request_id) do
    github_repository =
      Repo.preload(github_repository, github_installation: :github_installation_authorization)

    case GithubInstallations.client(github_repository.github_installation) do
      {:ok, client} ->
        github_installation_authorization =
          github_repository.github_installation.github_installation_authorization

        request =
          Github.Api.V3.Repos.Pulls.read_single(
            client,
            github_repository.data["full_name"],
            github_pull_request_id
          )

        payload = %{
          callback: &sync_callback_pull_request_detail/2,
          github_installation_authorization_id:
            github_repository.github_installation.github_installation_authorization.id,
          github_repository_id: github_repository.id,
          request: request
        }

        Jobs.GithubSync.InstallationAuthorizedRequest.enqueue(
          github_installation_authorization,
          payload
        )
    end
  end

  @doc """
  Update the pull request with its full details
  """
  def sync_callback_pull_request_detail(%{github_repository_id: github_repository_id}, response) do
    github_repository = Repo.get(GithubRepositories.GithubRepository, github_repository_id)

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
