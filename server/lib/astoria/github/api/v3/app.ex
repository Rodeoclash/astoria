defmodule Astoria.Github.Api.V3.App do
  alias Astoria.{Github}

  @doc ~S"""
  Note: Requires the app JWT client
  """
  def read(client) do
    Github.Api.V3.Request.new(client, :get, "app")
  end
end
