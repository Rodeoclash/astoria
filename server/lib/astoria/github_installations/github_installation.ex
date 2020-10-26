defmodule Astoria.GithubInstallations.GithubInstallation do
  alias Astoria.{GithubInstallationAuthorizations}
  use Ecto.Schema
  import Ecto.Changeset

  schema "github_installations" do
    field :data, :map
    field :github_id, :integer
    field :pub_id, :binary_id, read_after_writes: true

    has_one :github_installation_authorization,
            GithubInstallationAuthorizations.GithubInstallationAuthorization

    timestamps()
  end

  @doc false
  def changeset(organisation, attrs) do
    organisation
    |> cast(attrs, [:data, :github_id])
    |> validate_required([:data, :github_id])
  end
end
