defmodule Astoria.Github.Api.V3.User do
  alias Astoria.{Github}

  def read(client) do
    Github.Api.V3.Request.new(client, :get, "user")
  end
end
