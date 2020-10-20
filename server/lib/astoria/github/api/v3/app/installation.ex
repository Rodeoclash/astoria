defmodule Astoria.Github.Api.V3.App.Installation do
  alias Astoria.{Github}

  @doc ~S"""
  Note: Requires the app JWT
  """
  def access_tokens(client, installation_id) do
    Github.Api.V3.Request.new(client, :post, "app/installations/#{installation_id}/access_tokens")
  end
end
