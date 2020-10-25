defmodule Astoria.Repo.Migrations.CreateGithubInstallationOauthAuthorizations do
  use Ecto.Migration

  def change do
    create table(:github_installation_authorizations) do
      add :data, :map, default: %{}
      add :expires_at, :naive_datetime, null: false
      add :github_installation_id, references("github_installations")
      add :pub_id, :binary_id, null: false, default: fragment("uuid_generate_v4()")
      timestamps()
    end

    create unique_index(:github_installation_authorizations, :github_installation_id)
    create unique_index(:github_installation_authorizations, :pub_id)
  end
end
