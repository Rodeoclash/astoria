defmodule Astoria.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :citext, null: false, unique: true
      add :name, :string, null: false
      add :pub_id, :binary_id, null: false, default: fragment("uuid_generate_v4()")

      timestamps()
    end

    alter table(:github_authorizations) do
      add :user_id, references("users"), null: false, unique: true
    end
  end
end
