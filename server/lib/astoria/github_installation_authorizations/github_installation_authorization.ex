defmodule Astoria.GithubInstallationAuthorizations.GithubInstallationAuthorization do
  alias Astoria.{GithubInstallations}
  use Ecto.Schema
  import Ecto.Changeset

  schema "github_installation_authorizations" do
    belongs_to :github_installation, GithubInstallations.GithubInstallation
    field :data, :map
    field :expires_at, :naive_datetime
    field :token, :string
    timestamps()
  end

  @doc false
  def changeset(auth, attrs) do
    auth
    |> cast(attrs, [
      :data,
      :expires_at,
      :github_installation_id,
      :token
    ])
    |> validate_required([
      :data,
      :expires_at,
      :github_installation_id,
      :token
    ])
  end
end
