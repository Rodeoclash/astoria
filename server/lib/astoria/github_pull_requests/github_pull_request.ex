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
  def filter_by_github_repository_ids(query \\ GithubPullRequest, ids) do
    query
    |> where([github_pull_request], github_pull_request.github_repository_id in ^ids)
  end

  @doc """
  Group by the PR being merged in a specific period
  """
  def group_by_merged_in_period(query \\ GithubPullRequest, period) do
    query
    |> group_by(
      [github_pull_request],
      fragment("DATE_TRUNC(?, ?->>'merged_at')", ^period, github_pull_request.data)
    )
  end

  @doc """
  Group by specific users
  """
  def group_by_user(query \\ GithubPullRequest) do
    query
    |> group_by([github_pull_request], fragment("name"))
  end

  @doc """
  Get details about users
  """
  def user_summary(query \\ GithubPullRequest) do
    query
    |> select([github_pull_request], %{
      name: fragment("?->'user'->>'login' as name", github_pull_request.data),
      total: count(github_pull_request.id),
      first_seen: fragment("MIN(?->>'created_at')::timestamp", github_pull_request.data),
      last_seen: fragment("MAX(?->>'created_at')::timestamp", github_pull_request.data)
    })
  end
end
