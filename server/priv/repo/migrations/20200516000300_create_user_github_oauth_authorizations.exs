defmodule Astoria.Repo.Migrations.CreateUserGithubOauthAuthorizations do
  use Ecto.Migration

  def change do
    create table(:user_github_oauth_authorizations) do
      add :oauth_authorization_id, references("oauth_authorizations")
      add :pub_id, :binary_id, null: false, default: fragment("uuid_generate_v4()")
      add :user_id, references("users")
      timestamps()
    end

    create unique_index(:user_github_oauth_authorizations, [:oauth_authorization_id, :user_id])
  end
end
