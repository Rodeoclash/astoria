defmodule Astoria.Github.Api.V3.Repos.Pulls do
  alias Astoria.{Github}

  def read(client, options) do
    params =
      options
      |> Map.drop([:full_name])
      |> URI.encode_query()

    Github.Api.V3.Request.new(client, :get, "repos/#{options[:full_name]}/pulls?#{params}")
  end
end
