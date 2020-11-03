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
  Scope the query by the supplied github_repositories
  """
  def filter(query \\ GithubRepository, github_repositories) do
    ids = Enum.map(github_repositories, &(&1.id))

    IO.inspect(ids)

    query
    |> where([github_repository], github_repository.id in ^ids)
  end

  @doc """
  Count the number of results
  """
  def count(query \\ GithubRepository) do
    from(github_repository in GithubRepository,
      select: count(github_repository.id)
    )
  end

  def logins(github_repository) do
    # SELECT github_pull_requests.data->'user'->'login' AS github_name FROM github_pull_requests WHERE github_repository_id = 45 GROUP BY github_name;
  end
end
