defmodule Astoria.Repo.Migrations.MoveInstallationRateLimit do
  use Ecto.Migration

  def change do
    alter table(:github_installations) do
      remove :rate_limit_remaining, :integer
      remove :rate_limit_resets_at, :utc_datetime
    end

    alter table(:github_installation_authorizations) do
      add :rate_limit_remaining, :integer
      add :rate_limit_resets_at, :utc_datetime
    end
  end
end
