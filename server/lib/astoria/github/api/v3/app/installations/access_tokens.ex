defmodule Astoria.Github.Api.V3.App.Installations.AccessTokens do
  alias Astoria.{Github}

  @doc ~S"""
  Note: Requires the app JWT client
  """
  def create(client, installation_id) do
    Github.Api.V3.Request.new(client, :post, "app/installations/#{installation_id}/access_tokens")
  end
end
