defmodule Astoria.GithubPullRequests.GithubPullRequest do
  use Ecto.Schema
  import Ecto.Changeset

  schema "github_pull_requests" do
    field :data, :map
    field :pub_id, :binary_id, read_after_writes: true
    timestamps()
  end

  @doc false
  def changeset(organisation, attrs) do
    organisation
    |> cast(attrs, [:data])
    |> validate_required([])
  end
end
