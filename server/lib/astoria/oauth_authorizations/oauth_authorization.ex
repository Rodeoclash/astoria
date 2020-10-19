defmodule Astoria.OauthAuthorizations.OauthAuthorization do
  use Ecto.Schema
  import Ecto.Changeset

  schema "oauth_authorizations" do
    field :access_token, :string
    field :expires_in, :integer
    field :pub_id, :binary_id, read_after_writes: true
    field :refresh_token, :string
    field :refresh_token_expires_in, :integer
    field :token_type, :string
    timestamps()
  end

  @doc false
  def changeset(auth, attrs) do
    auth
    |> cast(attrs, [
      :access_token,
      :expires_in,
      :refresh_token,
      :refresh_token_expires_in,
      :token_type
    ])
    |> validate_required([
      :access_token,
      :expires_in,
      :refresh_token,
      :refresh_token_expires_in,
      :token_type
    ])
  end
end
