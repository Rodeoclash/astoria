defmodule Astoria.Repo.Migrations.AddUserInstallationManagement do
  use Ecto.Migration

  def change do
    create table(:roles) do
      add :pub_id, :binary_id, null: false, default: fragment("uuid_generate_v4()")
      add :name, :string, null: false
      add :description, :string, null: false
      timestamps()
    end

    create table(:user_github_installations) do
      add :pub_id, :binary_id, null: false, default: fragment("uuid_generate_v4()")
      add :user_id, references("users", on_delete: :delete_all), null: false
      add :role_id, references("roles", on_delete: :delete_all), null: false

      add :github_installation_id, references("github_installations", on_delete: :delete_all),
        null: false

      timestamps()
    end

    alter table(:github_installations) do
      remove :github_user_id, references("github_users", on_delete: :nilify_all)
    end

    create unique_index(:user_github_installations, [:user_id, :github_installation_id])
  end
end
