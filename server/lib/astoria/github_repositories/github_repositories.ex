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
  The list of contributors to this repo
  """
  @spec logins(%GithubInstallations.GithubInstallation{}) :: :ok
  def logins(github_repository) do
    GithubRepositories.GithubRepository.count(github_repository)
    |> Repo.all()
  end
end
