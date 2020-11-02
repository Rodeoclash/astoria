defmodule Astoria.GithubPullRequests.GithubPullRequest do
  alias Astoria.{GithubRepositories}
  use Ecto.Schema
  import Ecto.Changeset

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
end
