defmodule Astoria.Repo do
  use Ecto.Repo,
    otp_app: :astoria,
    adapter: Ecto.Adapters.Postgres
end
