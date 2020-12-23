defmodule Astoria.GithubPullRequests.GithubPullRequest do
  alias Astoria.{GithubRepositories}
  import Ecto.Changeset
  import Ecto.Query
  use Ecto.Schema

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

  def where_repository_id(query \\ GithubPullRequest, github_repository_id) do
    query
    |> where(
      [github_pull_request],
      github_pull_request.github_repository_id == ^github_repository_id
    )
  end

  def where_created_after(query \\ GithubPullRequest, date) do
    query
    |> where(
      [github_pull_request],
      fragment("(?->>'created_at')::timestamp > ?", github_pull_request.data, ^date)
    )
  end

  def where_created_before(query \\ GithubPullRequest, date) do
    query
    |> where(
      [github_pull_request],
      fragment("(?->>'created_at')::timestamp < ?", github_pull_request.data, ^date)
    )
  end

  def where_merged(query \\ GithubPullRequest) do
    query
    |> where(
      [github_pull_request],
      fragment("?->>'merged_at' IS NOT NULL", github_pull_request.data)
    )
  end

  def where_suitable_for_analysis(query \\ GithubPullRequest, github_repository_id, start, finish) do
    query
    |> where_repository_id(github_repository_id)
    |> where_created_after(start)
    |> where_created_before(finish)
  end
end
