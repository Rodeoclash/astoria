defmodule Astoria.Github.Api.V3.App.Installations.Repositories do
  alias Astoria.{Github}

  def read(client) do
    Github.Api.V3.Request.new(client, :get, "app/installations/repositories")
  end
end
