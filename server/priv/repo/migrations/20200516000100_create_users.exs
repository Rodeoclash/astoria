defmodule Astoria.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :citext, null: false
      add :name, :string, null: false
      add :pub_id, :binary_id, null: false, default: fragment("uuid_generate_v4()")

      timestamps()
    end

    create unique_index(:users, :email)
    create unique_index(:users, :pub_id)
  end
end
