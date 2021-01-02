defmodule Astoria.GithubInstallations.GithubRepositories do
  alias Astoria.{
    Github,
    GithubInstallations,
    GithubRepositories,
    Jobs,
    Repo
  }

  @doc """
  Trigger a sync of all repositories for this installation
  """
  @spec enqueue_github_installation_pull_requests_sync(%GithubInstallations.GithubInstallation{}) ::
          :ok
  def enqueue_github_installation_pull_requests_sync(github_installation) do
    case GithubInstallations.client(github_installation) do
      {:ok, client} ->
        request = Github.Api.V3.Installation.Repositories.read(client)

        payload = %{
          callback: &handle_github_installation_pull_requests_response/2,
          github_installation_id: github_installation.id,
          request: request
        }

        Jobs.GithubSync.InstallationAuthorizedRequest.enqueue(
          github_installation,
          payload
        )
    end
  end

  @doc """
  Updates details on repositories and launchs a sync of pull requests
  """
  def handle_github_installation_pull_requests_response(
        %{github_installation_id: github_installation_id},
        response
      ) do
    github_installation = Repo.get(GithubInstallations.GithubInstallation, github_installation_id)

    Enum.map(response.poison_response.body["repositories"], fn repository ->
      case GithubInstallations.GithubRepositories.upsert(github_installation, repository) do
        {:ok, github_repository} ->
          GithubRepositories.GithubPullRequests.enqueue_github_repository_pull_requests_sync(
            github_repository
          )
      end
    end)

    GithubInstallations.indicate_github_installation_repositories_updated(github_installation)
  end

  @doc """
  Insert data about the repository. Will update if matches github_id
  """
  @spec upsert(%GithubInstallations.GithubInstallation{}, map()) :: :ok
  def upsert(github_installation, data) do
    %GithubRepositories.GithubRepository{}
    |> GithubRepositories.GithubRepository.changeset(%{
      data: data,
      github_id: data["id"],
      github_installation_id: github_installation.id
    })
    |> Repo.insert(
      on_conflict: {:replace_all_except, [:id, :pub_id]},
      conflict_target: :github_id
    )
  end
end
