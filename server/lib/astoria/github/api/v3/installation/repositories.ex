defmodule Astoria.Github.Api.V3.Installation.Repositories do
  alias Astoria.{Github}

  def read(client) do
    Github.Api.V3.Request.new(
      client,
      :get,
      Path.join(Github.Api.endpoint(), "installation/repositories")
    )
  end
end
