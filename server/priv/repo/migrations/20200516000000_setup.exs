defmodule Astoria.Repo.Migrations.Setup do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION citext", "DROP EXTENSION citext"
    execute "CREATE EXTENSION \"uuid-ossp\";", "DROP EXTENSION \"uuid-ossp\";"
  end
end
