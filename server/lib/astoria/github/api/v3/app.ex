defmodule Astoria.Github.Api.V3.App do
  alias Astoria.{Github}

  @doc ~S"""
  Note: Requires the app JWT
  """
  def get(client) do
    Github.Api.V3.get(client, "app")
  end

  def installations(client) do
    Github.Api.V3.get(client, "app/installations")
  end
end
