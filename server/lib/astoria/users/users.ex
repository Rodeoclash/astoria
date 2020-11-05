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

  @doc ~S"""
  Find or create a user based on the auth object
  """
  @spec upsert(%Ueberauth.Auth.Info{}) :: %Users.User{}
  def upsert(data) do
    %Users.User{}
    |> Users.User.changeset(%{
      email: data.email,
      name: data.name
    })
    |> Repo.insert(
      on_conflict: {:replace_all_except, [:id, :pub_id]},
      conflict_target: :email
    )
  end
end
