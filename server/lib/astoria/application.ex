defmodule Astoria.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Astoria.Repo,
      # Start the Telemetry supervisor
      AstoriaWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Astoria.PubSub},
      # Start the Endpoint (http/https)
      AstoriaWeb.Endpoint,
      # Start a worker by calling: Astoria.Worker.start_link(arg)
      # {Astoria.Worker, arg}
      #
      {Oban, oban_config()}
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
