defmodule Astoria.Github.Api.V3.Installation.Repositories do
  alias Astoria.{Github}

  def read(client) do
    Github.Api.V3.Request.new(client, :get, "installation/repositories")
  end
end
