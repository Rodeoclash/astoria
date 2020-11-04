defmodule Astoria.Github.Api.V3.Repos.Pulls do
  alias Astoria.{Github}

  def read(client, options) do
    params =
      options
      |> Map.drop([:full_name, :id])
      |> URI.encode_query()

    id = "/#{options[:id]}" || ""

    Github.Api.V3.Request.new(client, :get, "repos/#{options[:full_name]}/pulls#{id}?#{params}")
  end
end
