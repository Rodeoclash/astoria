defmodule Astoria.Github.Api.V3.App.Installations do
  alias Astoria.{Github}

  def read(client) do
    Github.Api.V3.Request.new(client, :get, Path.join(Github.Api.endpoint(), "app/installations"))
  end

  def read(client, options) do
    Github.Api.V3.Request.new(
      client,
      :get,
      Path.join(Github.Api.endpoint(), "app/installations/#{options[:installation_id]}")
    )
  end
end
