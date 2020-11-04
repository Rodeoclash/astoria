defmodule Astoria.GithubRepositories.GithubRepository do
  alias Astoria.{GithubInstallations, GithubPullRequests}
  alias __MODULE__
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "github_repositories" do
    belongs_to :github_installation, GithubInstallations.GithubInstallation

    field :data, :map
    field :github_id, :integer
    field :pub_id, :binary_id, read_after_writes: true

    has_many :github_pull_requests,
             GithubPullRequests.GithubPullRequest

    timestamps()
  end

  @doc false
  def changeset(organisation, attrs) do
    organisation
    |> cast(attrs, [:data, :github_id, :github_installation_id])
    |> validate_required([:data, :github_id, :github_installation_id])
  end

  @doc """
  Scope the query by the supplied installation id
  """
  def filter_by_github_installation_id(query \\ GithubRepository, id) do
    query
    |> where([github_repository], github_repository.github_installation_id == ^id)
  end

  @doc """
  Scope the query by the supplied github_repositories
  """
  def filter_by_pub_id(query \\ GithubRepository, pub_ids) do
    query
    |> where([github_repository], github_repository.pub_id in ^pub_ids)
  end

  @doc """
  Count the number of results
  """
  def count(query \\ GithubRepository) do
    query
    |> select([github_repository], count(github_repository.id))
  end
end
