# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :astoria,
  public_name: "Astoria",
  ecto_repos: [Astoria.Repo],
  http_client: HTTPoison

# Configures the endpoint
config :astoria, AstoriaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/JGPgwRd7muqXueIDhN+IAHxoAfkKLa8Q1KG17VtNtt5mW3aOUkGUsvsGkz7Dj+5",
  render_errors: [view: AstoriaWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Astoria.PubSub,
  live_view: [signing_salt: "9BI58KlH"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :ueberauth, Ueberauth,
  providers: [
    github: {Ueberauth.Strategy.Github, [default_scope: "user:email"]}
  ]

config :absinthe,
  schema: AstoriaWeb.Schema

config :astoria, Oban,
  repo: Astoria.Repo,
  plugins: [Oban.Plugins.Pruner],
  queues: [sync_github: 5]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
