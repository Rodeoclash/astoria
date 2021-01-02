defmodule Astoria.Users do
  alias Astoria.{Repo, Users, GithubInstallations}
  alias __MODULE__

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

  def indicate_github_installation_repositories_updated(user, opts \\ []) do
    if Keyword.get(opts, :delayed) == true do
      Process.sleep(1000)
    end

    user = Repo.preload(user, :github_installations)

    Enum.map(user.github_installations, fn github_installation ->
      GithubInstallations.indicate_github_installation_repositories_updated(github_installation)
    end)
  end
end
