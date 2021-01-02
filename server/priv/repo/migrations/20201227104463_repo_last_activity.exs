defmodule Astoria.Repo.Migrations.RepoLastActivity do
  use Ecto.Migration

  def change do
    alter table(:github_repositories) do
      add :last_activity_at, :utc_datetime
    end
  end
end
