defmodule Astoria.GithubInstallations.GithubRepositories do
  alias Astoria.{GithubInstallations, GithubRepositories, Github, Jobs, Utility, Repo}

  @doc """
  Trigger a sync of all repositories for this installation
  """
  @spec sync(%GithubInstallations.GithubInstallation{}) :: :ok
  def sync(github_installation) do
    case GithubInstallations.client(github_installation) do
      {:ok, client} ->
        github_installation =
          Repo.preload(github_installation, :github_installation_authorization)

        request = Github.Api.V3.Installation.Repositories.read(client)

        encoded =
          %{
            callback: &sync_callback/2,
            github_installation_authorization_id:
              github_installation.github_installation_authorization.id,
            github_installation_id: github_installation.id,
            request: request
          }
          |> Utility.serialise()

        %{encoded: encoded}
        |> Jobs.GithubSync.InstallationAuthorizedRequest.new()
        |> Oban.insert()
    end
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

  @doc """
  Updates details on repositories and launchs a sync of pull requests
  """
  def sync_callback(%{github_installation_id: github_installation_id}, response) do
    github_installation = Repo.get(GithubInstallations.GithubInstallation, github_installation_id)

    Enum.map(response.poison_response.body["repositories"], fn repository ->
      case GithubInstallations.GithubRepositories.upsert(github_installation, repository) do
        {:ok, github_repository} ->
          GithubRepositories.GithubPullRequests.sync(github_repository)
      end
    end)
  end
end
