defmodule Astoria.Repo.Migrations.CreateOauthAuthorizations do
  use Ecto.Migration

  def change do
    create table(:oauth_authorizations) do
      add :access_token, :string, null: false
      add :expires_in, :integer, null: false
      add :refresh_token, :string, null: false
      add :refresh_token_expires_in, :integer, null: false
      add :token_type, :string, null: false

      timestamps()
    end

    execute "ALTER TABLE oauth_authorizations ADD COLUMN expires_at timestamp(0) without time zone GENERATED ALWAYS AS (inserted_at + expires_in * interval '1' second) stored;",
            "ALTER TABLE oauth_authorizations DROP COLUMN expires_at;"

    create table(:github_oauth_authorizations,
             primary_key: false,
             options: "INHERITS (oauth_authorizations)"
           ) do
      add :user_id, references("users")
    end

    create unique_index(:github_oauth_authorizations, :user_id)
  end
end
