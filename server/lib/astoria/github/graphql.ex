defmodule Astoria.Github.GraphQL do
  alias Astoria.{Github}

  @http_client Application.get_env(:astoria, :http_client)

  @doc ~S"""
  Github GraphQL endpoint
  """
  @spec endpoint() :: String.t()
  def endpoint do
    "https://api.#{Github.domain()}/graphql"
  end

  @doc ~S"""
  Required headers for GraphQL access.

  ## Examples

      iex> Astoria.Github.GraphQL.authorization_header("123")
      [{"Authorization", "bearer 123"}]

  """
  @spec authorization_header(String.t()) :: [Authorization: String.t()]
  def authorization_header(token) do
    [{"Authorization", "bearer #{token}"}]
  end

  @doc ~S"""
  Perform a request against the Github GraphQL API
  """
  def query(token, content) do
    with {:ok, encoded_content} <-
           Jason.encode(%{
             query: content
           }),
         {:ok, %HTTPoison.Response{body: body}} <-
           @http_client.post(
             endpoint(),
             encoded_content,
             authorization_header(token)
           ),
         {:ok, decoded_body} <- Jason.decode(body),
         data <- struct(Github.GraphQL.Response, %{data: decoded_body["data"]}),
         do: {:ok, data}
  end
end
