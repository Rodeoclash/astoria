defmodule Astoria.Github.Api.V3 do
  alias Astoria.{Github}

  @http_client Application.get_env(:astoria, :http_client)

  @doc ~S"""
  Required headers for V3 api
  """
  @spec headers(%Github.Api.Client{}) :: [{String.t(), String.t()}]
  def headers(client) do
    Github.Api.headers(client) ++
      [
        {"Accept", "application/vnd.github.v3+json"}
      ]
  end

  @doc ~S"""
  Post against the Github rest API
  """
  @spec post(%Github.Api.Client{}, String.t(), String.t()) :: nil
  def post(client, url, content \\ "") do
    with {:ok, response} <-
           @http_client.post(
             url,
             content,
             headers(client)
           ),
         do: process_response(response)
  end

  @doc ~S"""
  Get against the Github rest API
  """
  @spec get(%Github.Api.Client{}, String.t()) :: nil
  def get(client, url) do
    with {:ok, response} <-
           @http_client.get(
             url,
             headers(client)
           ),
         do: process_response(response)
  end

  @doc ~S"""
  Handle a response from a request. Encodes the JSON response to a map.
  """
  @spec process_response(%HTTPoison.Response{}) :: %Github.Api.V3.Response{}
  def process_response(response) do
    case Jason.decode(response.body) do
      {:ok, decoded_body} ->
        {:ok, Github.Api.V3.Response.new(%{response | body: decoded_body})}
    end
  end
end
