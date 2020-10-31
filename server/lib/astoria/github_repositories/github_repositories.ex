defmodule Astoria.GithubRepositories do
  alias Astoria.{GithubInstallations, GithubRepositories, Repo}

  import Ecto.Query, only: [from: 2]

  @doc """
  How many repositories have been created
  """
  @spec count() :: :ok
  def count do
    from(github_repository in GithubRepositories.GithubRepository,
      select: count(github_repository.id)
    )
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
end
