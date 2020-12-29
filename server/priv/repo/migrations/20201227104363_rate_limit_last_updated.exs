defmodule Astoria.Repo.Migrations.RateLimitLastUpdated do
  use Ecto.Migration

  def change do
    alter table(:github_installation_authorizations) do
      add :rate_limit_last_updated_at, :utc_datetime
    end
  end
end
