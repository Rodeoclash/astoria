defmodule Astoria.GithubAuthorizations.GithubAuthorization do
  alias Astoria.{Users}
  use Ecto.Schema
  import Ecto.Changeset

  schema "github_authorizations" do
    belongs_to :user, Users.User
    field :access_token, :string
    field :expires_in, :integer
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
      :token_type,
      :user_id
    ])
    |> validate_required([
      :access_token,
      :expires_in,
      :refresh_token,
      :refresh_token_expires_in,
      :token_type,
      :user_id
    ])
  end
end
