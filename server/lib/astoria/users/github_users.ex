defmodule Astoria.Users.GithubUsers do
  alias Astoria.{GithubUsers, Users, Repo}

  @doc ~S"""
  Update / insert the github user.
  """
  @spec upsert(%Users.User{}, map()) :: %GithubUsers.GithubUser{}
  def upsert(user, data) do
    %GithubUsers.GithubUser{}
    |> GithubUsers.GithubUser.changeset(%{
      data: data,
      github_id: data["id"],
      user_id: user.id
    })
    |> Repo.insert(
      on_conflict: {:replace_all_except, [:id, :user_id]},
      conflict_target: :user_id
    )
  end
end
