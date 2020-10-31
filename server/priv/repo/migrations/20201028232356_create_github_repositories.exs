defmodule Astoria.Repo.Migrations.CreateGithubRepositories do
  use Ecto.Migration

  def change do
    create table(:github_repositories) do
      add :data, :map, null: false
      add :github_id, :integer, null: false
      add :github_installation_id, :integer, null: false
      add :pub_id, :binary_id, null: false, default: fragment("uuid_generate_v4()")
      timestamps()
    end

    create unique_index(:github_repositories, :github_id)
    create unique_index(:github_repositories, :pub_id)
  end
end
