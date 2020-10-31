defmodule Astoria.GithubRepositories.GithubRepository do
  alias Astoria.{GithubInstallations}
  use Ecto.Schema
  import Ecto.Changeset

  schema "github_repositories" do
    field :data, :map
    field :github_id, :integer
    field :pub_id, :binary_id, read_after_writes: true

    belongs_to :github_installation, GithubInstallations.GithubInstallation

    timestamps()
  end

  @doc false
  def changeset(organisation, attrs) do
    organisation
    |> cast(attrs, [:data, :github_id, :github_installation_id])
    |> validate_required([:data, :github_id, :github_installation_id])
  end
end
