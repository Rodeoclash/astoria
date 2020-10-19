defmodule Astoria.UserGithubOauthAuthorizations.UserGithubOauthAuthorization do
  alias Astoria.{Users, OauthAuthorizations}
  use Ecto.Schema
  import Ecto.Changeset

  # Inherits from OauthAuthorization
  schema "user_github_oauth_authorizations" do
    belongs_to :oauth_authorization_id, OauthAuthorizations.OauthAuthorization
    belongs_to :user, Users.User
    timestamps()
  end

  @doc false
  def changeset(auth, attrs) do
    auth
    |> cast(attrs, [
      :oauth_authorization_id,
      :user_id
    ])
    |> validate_required([
      :oauth_authorization_id,
      :user_id
    ])
  end
end
