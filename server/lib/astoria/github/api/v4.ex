defmodule Astoria.Github.Api.V4 do
  alias Astoria.{Github}

  @http_client Application.get_env(:astoria, :http_client)

  @doc ~S"""
  Github V4 (GraphQL) endpoint

  ## Examples

    iex> Astoria.Github.Api.V4.endpoint()
    "https://api.github.com/graphql"

  """
  @spec endpoint() :: String.t()
  def endpoint do
    Github.Api.endpoint() <> "/graphql"
  end

  @doc ~S"""
  Perform a request against the Github GraphQL API
  """
  def perform(client, content) do
    with {:ok, encoded_content} <-
           Jason.encode(%{
             query: content
           }),
         {:ok, %HTTPoison.Response{body: body}} <-
           @http_client.post(
             endpoint(),
             encoded_content,
             Github.Api.headers(client)
           ),
         {:ok, decoded_body} <- Jason.decode(body),
         data <- struct(Github.GraphQL.Response, %{data: decoded_body["data"]}),
         do: {:ok, data}
  end
end
