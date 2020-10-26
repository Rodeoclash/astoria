defmodule Astoria.Repo.Migrations.AddGithubUsers do
  use Ecto.Migration

  def change do
    create table(:github_users) do
      add :data, :map, null: false
      add :github_id, :integer, null: false, unique: true
      add :pub_id, :binary_id, null: false, default: fragment("uuid_generate_v4()")
      add :user_id, references("users")
      timestamps()
    end

    create unique_index(:github_users, :github_id)
    create unique_index(:github_users, :pub_id)
    create unique_index(:github_users, :user_id)
  end
end
