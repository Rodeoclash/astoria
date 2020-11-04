defmodule Astoria.Github.Api.V3.Repos.Pulls do
  alias Astoria.{Github}

  def read_single(client, full_name, id, options \\ %{}) do
    params =
      options
      |> URI.encode_query()

    Github.Api.V3.Request.new(client, :get, "repos/#{full_name}/pulls/#{id}?#{params}")
  end

  def read_list(client, full_name, options \\ %{}) do
    params =
      options
      |> URI.encode_query()

    Github.Api.V3.Request.new(client, :get, "repos/#{full_name}/pulls?#{params}")
  end
end
