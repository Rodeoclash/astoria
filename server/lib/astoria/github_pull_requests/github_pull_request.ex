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
    |> group_by([github_pull_request], fragment("name"))
  end
end
