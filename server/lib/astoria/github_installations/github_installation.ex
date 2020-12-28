defmodule Astoria.GithubInstallations.GithubInstallation do
  alias Astoria.{
    GithubInstallationAuthorizations,
    GithubRepositories,
    UserGithubInstallations,
    Users
  }

  alias __MODULE__
  import Ecto.Changeset
  import Ecto.Query
  use Ecto.Schema

  schema "github_installations" do
    field :data, :map
    field :github_id, :integer
    field :pub_id, :binary_id, read_after_writes: true

    has_one :github_installation_authorization,
            GithubInstallationAuthorizations.GithubInstallationAuthorization

    has_many :github_repositories,
             GithubRepositories.GithubRepository

    has_many :user_github_installations, UserGithubInstallations.UserGithubInstallation

    timestamps()
  end

  @doc false
  def changeset(organisation, attrs) do
    organisation
    |> cast(attrs, [
      :data,
      :github_id
    ])
    |> validate_required([:github_id])
  end

  def for_user(query \\ GithubInstallation, user_id) do
    query
    |> join(
      :left,
      [github_installation],
      user_github_installation in UserGithubInstallations.UserGithubInstallation,
      on: user_github_installation.github_installation_id == github_installation.id
    )
    |> join(
      :left,
      [github_installation, user_github_installation],
      user in Users.User,
      on: user_github_installation.user_id == user.id
    )
    |> where(
      [github_installation, user_github_installation, user],
      user.id == ^user_id
    )
  end
end
