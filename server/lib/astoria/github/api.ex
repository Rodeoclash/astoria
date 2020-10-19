defmodule Astoria.Github.Api do
  alias Astoria.{Github}

  @doc ~S"""
  Github API endpoint
  """
  @spec endpoint() :: String.t()
  def endpoint do
    "https://api.#{Github.domain()}"
  end

  @doc ~S"""
  Required headers for all Github APIs
  """
  @spec headers(%Github.Api.Client{}) :: [{String.t(), String.t()}]
  def headers(client) do
    [
      {"Authorization", "Bearer #{client.access_token}"},
      {"Content-Type", "application/json"}
    ]
  end
end
