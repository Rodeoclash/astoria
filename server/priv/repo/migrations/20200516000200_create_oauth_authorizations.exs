defmodule Astoria.Repo.Migrations.CreateOauthAuthorizations do
  use Ecto.Migration

  def change do
    create table(:oauth_authorizations) do
      add :access_token, :string, null: false
      add :expires_in, :integer, null: false
      add :pub_id, :binary_id, null: false, default: fragment("uuid_generate_v4()")
      add :refresh_token, :string, null: false
      add :refresh_token_expires_in, :integer, null: false
      add :token_type, :string, null: false

      timestamps()
    end
  end
end
