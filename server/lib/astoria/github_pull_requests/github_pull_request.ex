defmodule Astoria.GithubPullRequests.GithubPullRequest do
  alias Astoria.{GithubRepositories}
  alias __MODULE__
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "github_pull_requests" do
    belongs_to :github_repository, GithubRepositories.GithubRepository

    field :data, :map
    field :github_id, :integer
    field :pub_id, :binary_id, read_after_writes: true

    timestamps()
  end

  @doc false
  def changeset(organisation, attrs) do
    organisation
    |> cast(attrs, [:data, :github_id, :github_repository_id])
    |> validate_required([:data, :github_id, :github_repository_id])
  end

  @doc """
  Scope the query by the supplied github repository ids
  """
  def filter_by_github_repository_id(query \\ GithubPullRequest, id) do
    query
    |> where([github_pull_request], github_pull_request.github_repository_id == ^id)
  end

  # @doc """
  # Get details about users, used to populate the inputs to the filters.
  # """
  # def select_user_summary(query \\ GithubPullRequest) do
  #  query
  #  |> select([github_pull_request], %{
  #    name: fragment("?->'user'->>'login'", github_pull_request.data),
  #    total: count(github_pull_request.id),
  #    first_seen: fragment("MIN(?->>'created_at')::timestamp", github_pull_request.data),
  #    last_seen: fragment("MAX(?->>'created_at')::timestamp", github_pull_request.data)
  #  })
  # end

  @doc """
  Get details about users, used to populate the inputs to the filters.
  """
  def select_merged_prs(query \\ GithubPullRequest, period) do
    query
    |> select([github_pull_request], %{
      ys: fragment("COUNT(?)", github_pull_request.id),
      xs:
        fragment("DATE_TRUNC(?, (?->>'merged_at')::timestamp)", ^period, github_pull_request.data),
      entities: fragment("?->'user'->>'login'", github_pull_request.data)
    })
    |> where(
      [github_pull_request],
      fragment("?->>'merged_at' IS NOT NULL", github_pull_request.data)
    )
    |> group_by(fragment("xs, entities"))
    |> order_by(fragment("xs"))
  end

  @doc """
  Takes a sub query result set and converts it to a format suitable for plotly
  """
  def count_per_person(query) do
    query
    |> subquery()
    |> select([source], %{
      name: source.entities,
      x: fragment("ARRAY_AGG(?)", source.xs),
      y: fragment("ARRAY_AGG(?)", source.ys)
    })
    |> group_by([source], source.entities)
  end

  @doc """
  Takes a sub query result set and converts it to a format suitable for plotly
  """
  def total_merged_prs(query) do
    query
    |> subquery()
    |> select([source], %{
      grouper: 1,
      x: source.xs,
      y: fragment("SUM(?)::integer", source.ys)
    })
    |> group_by([source], source.xs)
    |> subquery()
    |> select([source], %{
      name: 'total',
      x: fragment("ARRAY_AGG(?)", source.x),
      y: fragment("ARRAY_AGG(?)", source.y)
    })
    |> group_by([source], source.grouper)
  end
end
