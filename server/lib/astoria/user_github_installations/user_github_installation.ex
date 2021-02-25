defmodule Astoria.UserGithubInstallations.UserGithubInstallation do
  alias Astoria.{Roles, Users, GithubInstallations}
  alias __MODULE__
  import Ecto.Changeset
  import Ecto.Query
  use Ecto.Schema

  schema "user_github_installations" do
    belongs_to :user, Users.User
    belongs_to :role, Roles.Role
    belongs_to :github_installation, GithubInstallations.GithubInstallation
    field :pub_id, :binary_id, read_after_writes: true
    timestamps()
  end

  @doc false
  def changeset(organisation, attrs) do
    organisation
    |> cast(attrs, [:user_id, :role_id, :github_installation_id])
    |> validate_required([:user_id, :role_id, :github_installation_id])
  end

  def for_user(query \\ UserGithubInstallation, user_id) do
    query
    |> where(
      [user_github_installation],
      user_github_installation.user_id == ^user_id
    )
  end
end
