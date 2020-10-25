defmodule Astoria.Github.Api.Oauth do
  alias Astoria.{Github}

  @http_client Application.get_env(:astoria, :http_client)

  @doc ~S"""
  Github Oauth token exchange endpoint
  """
  @spec endpoint() :: String.t()
  def endpoint do
    "https://#{Github.domain()}/login/oauth/access_token"
  end

  @doc ~S"""
  Required headers for Oauth query
  """
  @spec headers() :: ["Content-Type": String.t()]
  def headers() do
    [{"Content-Type", "application/json"}]
  end

  @doc ~S"""
  Make a post to the Github Oauth endpoint
  """
  def create(content) do
    with {:ok, %HTTPoison.Response{body: body}} <-
           @http_client.post(
             endpoint(),
             content,
             headers()
           ),
         do: {:ok, URI.decode_query(body)}
  end
end
