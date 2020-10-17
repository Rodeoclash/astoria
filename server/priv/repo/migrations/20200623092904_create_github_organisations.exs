defmodule Astoria.Repo.Migrations.CreateGithubOrganisations do
  use Ecto.Migration

  def change do
    create table(:github_organisations) do
      add :data, :map, default: %{}
      add :pub_id, :binary_id, null: false, default: fragment("uuid_generate_v4()")
      timestamps()
    end
  end
end
