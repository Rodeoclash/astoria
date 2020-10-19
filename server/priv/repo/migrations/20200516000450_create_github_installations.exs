defmodule Astoria.Repo.Migrations.CreateGithubInstallations do
  use Ecto.Migration

  def change do
    create table(:github_installations) do
      add :data, :map, default: %{}
      add :github_id, :integer, null: false
      add :pub_id, :binary_id, null: false, default: fragment("uuid_generate_v4()")
      timestamps()
    end

    create unique_index(:github_pull_requests, :github_id)
  end
end
