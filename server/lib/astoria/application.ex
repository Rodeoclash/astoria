defmodule Astoria.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Astoria.Repo,
      AstoriaWeb.Telemetry,
      {Phoenix.PubSub, name: Astoria.PubSub},
      AstoriaWeb.Endpoint,
      {Oban, oban_config()},
      {Absinthe.Subscription, AstoriaWeb.Endpoint},
      AstoriaWeb.Schema.QueuedPublisher
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Astoria.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    AstoriaWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp oban_config do
    Application.get_env(:astoria, Oban)
  end
end
