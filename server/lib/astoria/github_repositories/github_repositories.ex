defmodule Astoria.GithubRepositories do
  alias Astoria.{GithubInstallations, GithubRepositories, Repo}

  @doc """
  How many repositories have been created
  """
  @spec count() :: :ok
  def count do
    GithubRepositories.GithubRepository.count()
    |> Repo.one()
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
  The list of contributors to this repo
  """
  @spec logins(%GithubInstallations.GithubInstallation{}) :: :ok
  def logins(github_repository) do
    GithubRepositories.GithubRepository.count(github_repository)
    |> Repo.all()
  end
end
