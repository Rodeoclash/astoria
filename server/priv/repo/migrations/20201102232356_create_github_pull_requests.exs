defmodule Astoria.Repo.Migrations.CreateGithubPullRequests do
  use Ecto.Migration

  def change do
    create table(:github_pull_requests) do
      add :data, :map, null: false
      add :github_id, :integer, null: false

      add :github_repository_id, references("github_repositories", on_delete: :delete_all),
        null: false

      add :pub_id, :binary_id, null: false, default: fragment("uuid_generate_v4()")
      timestamps()
    end

    create unique_index(:github_pull_requests, :github_id)
    create unique_index(:github_pull_requests, :pub_id)
    create index(:github_pull_requests, :github_repository_id)
  end
end
