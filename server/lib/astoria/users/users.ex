defmodule Astoria.Users do
  alias Astoria.{Repo, GithubRepositories, Users}
  alias __MODULE__

  @doc ~S"""
  Gets a single user by id
  """
  @spec github_repositories(%Users.User{}) :: [%GithubRepositories.GithubRepository{}]
  def github_repositories(user) do
    GithubRepositories.GithubRepository.for_users([user.id])
    |> Repo.all()
  end
end
