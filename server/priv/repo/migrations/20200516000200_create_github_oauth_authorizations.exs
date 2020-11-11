defmodule Astoria.Repo.Migrations.CreateOauthAuthorizations do
  use Ecto.Migration

  def change do
    create table(:oauth_authorizations) do
      add :expires, :boolean
      add :expires_at, :integer
      add :other, :map, null: false
      add :refresh_token, :string
      add :scopes, {:array, :string}, null: false
      add :secret, :string
      add :token, :string
      add :token_type, :string

      timestamps()
    end

    create table(:github_oauth_authorizations,
             primary_key: false,
             options: "INHERITS (oauth_authorizations)"
           ) do
      add :user_id, references("users"), null: false
    end

    create unique_index(:github_oauth_authorizations, :user_id)
  end
end
