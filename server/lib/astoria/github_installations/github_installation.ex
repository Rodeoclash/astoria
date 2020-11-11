defmodule Astoria.GithubInstallations.GithubInstallation do
  alias Astoria.{GithubInstallationAuthorizations, GithubRepositories, GithubUsers}
  alias __MODULE__
  import Ecto.Changeset
  import Ecto.Query
  use Ecto.Schema

  schema "github_installations" do
    field :data, :map
    field :github_id, :integer
    field :pub_id, :binary_id, read_after_writes: true
    field :rate_limit_remaining, :integer
    field :rate_limit_resets_at, :utc_datetime

    belongs_to :github_user,
               GithubUsers.GithubUser

    has_one :github_installation_authorization,
            GithubInstallationAuthorizations.GithubInstallationAuthorization

    has_many :github_repositories,
             GithubRepositories.GithubRepository

    timestamps()
  end

  @doc false
  def changeset(organisation, attrs) do
    organisation
    |> cast(attrs, [
      :data,
      :github_id,
      :rate_limit_remaining,
      :rate_limit_resets_at,
      :github_user_id
    ])
    |> validate_required([:data, :github_id])
  end

  @doc """
  Scope the query by the supplied installation id
  """
  def where_installation_id(query \\ GithubInstallation, id) do
    query
    |> where([github_installation], fragment("(?->>'id') = ?", github_installation.data, ^id))
  end
end
