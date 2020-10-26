defmodule Astoria.Repo.Migrations.CreateGithubInstallationOauthAuthorizations do
  use Ecto.Migration

  def change do
    create table(:github_installation_authorizations) do
      add :data, :map, null: false
      add :expires_at, :naive_datetime, null: false
      add :token, :string, null: false
      add :github_installation_id, references("github_installations")
      timestamps()
    end

    create unique_index(:github_installation_authorizations, :github_installation_id)
  end
end
