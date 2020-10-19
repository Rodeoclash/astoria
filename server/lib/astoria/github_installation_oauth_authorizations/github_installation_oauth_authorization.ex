defmodule Astoria.GithubInstallationOauthAuthorizations.GithubInstallationOauthAuthorization do
  alias Astoria.{OauthAuthorizations, GithubInstallations}
  use Ecto.Schema
  import Ecto.Changeset

  # Inherits from OauthAuthorization
  schema "github_installation_oauth_authorizations" do
    belongs_to :github_installation, GithubInstallations.GithubInstallation
    belongs_to :oauth_authorization, OauthAuthorizations.OauthAuthorization
    timestamps()
  end

  @doc false
  def changeset(auth, attrs) do
    auth
    |> cast(attrs, [
      :github_installation_id,
      :oauth_authorization_id
    ])
    |> validate_required([
      :github_installation_id,
      :oauth_authorization_id
    ])
  end
end
