defmodule Astoria.GithubInstallationAuthorizations.GithubInstallationAuthorization do
  alias Astoria.{GithubInstallations}
  import Ecto.Changeset
  use Ecto.Schema

  schema "github_installation_authorizations" do
    belongs_to :github_installation, GithubInstallations.GithubInstallation
    field :data, :map
    field :expires_at, :utc_datetime
    field :rate_limit_last_updated_at, :utc_datetime
    field :rate_limit_remaining, :integer
    field :rate_limit_resets_at, :utc_datetime
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
      :rate_limit_remaining,
      :rate_limit_resets_at,
      :rate_limit_last_updated_at,
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
