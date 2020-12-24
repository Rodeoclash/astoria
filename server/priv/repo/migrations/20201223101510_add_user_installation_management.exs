defmodule Astoria.Repo.Migrations.AddUserInstallationManagement do
  alias Astoria.{Roles, Repo}
  use Ecto.Migration

  def up do
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
      remove :github_user_id
    end

    create unique_index(:user_github_installations, [:user_id, :github_installation_id])

    flush()

    %Roles.Role{}
    |> Roles.Role.changeset(%{
      id: 1,
      name: "Administrator",
      description:
        "Able to manage all aspects of the installation, including promoting other users to user management."
    })
    |> Repo.insert(
      on_conflict: {:replace_all_except, [:id, :pub_id]},
      conflict_target: :id
    )

    %Roles.Role{}
    |> Roles.Role.changeset(%{
      id: 1,
      name: "User",
      description:
        "Able to view installations they are attached to but not add other users to those installations."
    })
    |> Repo.insert(
      on_conflict: {:replace_all_except, [:id, :pub_id]},
      conflict_target: :id
    )
  end

  def down do
    drop unique_index(:user_github_installations, [:user_id, :github_installation_id])

    alter table(:github_installations) do
      add :github_user_id, references("github_users", on_delete: :nilify_all)
    end

    drop table(:user_github_installations)

    drop table(:roles)
  end
end
