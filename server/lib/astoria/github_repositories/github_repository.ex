defmodule Astoria.GithubRepositories.GithubRepository do
  alias Astoria.{GithubInstallations, GithubPullRequests}
  alias __MODULE__
  import Ecto.Changeset
  import Ecto.Query
  use Ecto.Schema

  schema "github_repositories" do
    belongs_to :github_installation, GithubInstallations.GithubInstallation

    field :data, :map
    field :github_id, :integer
    field :pub_id, :binary_id, read_after_writes: true

    has_many :github_pull_requests,
             GithubPullRequests.GithubPullRequest

    has_one :github_installation_authorization,
      through: [:github_installation, :github_installation_authorization]

    timestamps()
  end

  @doc false
  def changeset(organisation, attrs) do
    organisation
    |> cast(attrs, [:data, :github_id, :github_installation_id])
    |> validate_required([:data, :github_id, :github_installation_id])
  end

  @doc """
  Count the number of results
  """
  def count(query \\ GithubRepository) do
    query
    |> select([github_repository], count(github_repository.id))
  end

  def filter_by_github_installation_id(query \\ GithubRepository, github_installation_id) do
    query
    |> where(
      [github_repository],
      github_repository.github_installation_id == ^github_installation_id
    )
  end
end
