defmodule Astoria.GithubOauthAuthorizations.GithubOauthAuthorization do
  alias Astoria.{Users}
  use Ecto.Schema
  import Ecto.Changeset

  schema "github_oauth_authorizations" do
    belongs_to :user, Users.User
    field :expires, :boolean
    field :expires_at, :integer
    field :other, :map
    field :refresh_token, :string
    field :scopes, {:array, :string}
    field :secret, :string
    field :token, :string
    field :token_type, :string
    timestamps()
  end

  @doc false
  def changeset(auth, attrs) do
    auth
    |> cast(attrs, [
      :expires,
      :expires_at,
      :other,
      :scopes,
      :secret,
      :refresh_token,
      :token,
      :token_type,
      :user_id
    ])
    |> validate_required([
      :other,
      :scopes,
      :user_id
    ])
  end
end
