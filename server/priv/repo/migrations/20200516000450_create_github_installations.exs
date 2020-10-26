defmodule Astoria.Repo.Migrations.CreateGithubInstallations do
  use Ecto.Migration

  def change do
    create table(:github_installations) do
      add :data, :map, null: false
      add :github_id, :integer, null: false
      add :pub_id, :binary_id, null: false, default: fragment("uuid_generate_v4()")
      timestamps()
    end

    create unique_index(:github_installations, :github_id)
    create unique_index(:github_installations, :pub_id)
  end
end
