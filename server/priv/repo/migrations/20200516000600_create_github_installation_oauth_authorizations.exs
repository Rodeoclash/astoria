defmodule Astoria.Repo.Migrations.CreateGithubInstallationOauthAuthorizations do
  use Ecto.Migration

  def change do
    create table(:github_installation_oauth_authorizations) do
      add :github_installation_id, references("github_installations")
      add :oauth_authorization_id, references("oauth_authorizations")
      add :pub_id, :binary_id, null: false, default: fragment("uuid_generate_v4()")
      timestamps()
    end

    create unique_index(:github_installation_oauth_authorizations, [
             :github_installation_id,
             :oauth_authorization_id
           ])
  end
end
