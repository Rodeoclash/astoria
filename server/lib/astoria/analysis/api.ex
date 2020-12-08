defmodule Astoria.Analysis.Api do
  alias Astoria.{Analysis}

  @http_client Application.get_env(:astoria, :http_client)

  @doc ~S"""
  Analysis API endpoint
  """
  @spec endpoint() :: String.t()
  def endpoint() do
    "http://analysis:8000"
  end

  @doc ~S"""
  Required headers for all Analysis API calls
  """
  @spec headers() :: [{String.t(), String.t()}]
  def headers() do
    [
      {"Content-Type", "application/json"}
    ]
  end

  @doc ~S"""
  Post against the Analysis rest API
  """
  @spec post(String.t(), String.t()) :: nil
  def post(url, content \\ "") do
    with {:ok, response} <-
           @http_client.post(
             url,
             content,
             headers()
           ),
         do: process_response(response)
  end

  @doc ~S"""
  Handle a response from a request. Encodes the JSON response to a map.
  """
  @spec process_response(%HTTPoison.Response{}) :: %Analysis.Api.Response{}
  def process_response(response) do
    case Jason.decode(response.body) do
      {:ok, decoded_body} ->
        {:ok, Analysis.Api.Response.new(%{response | body: decoded_body})}
    end
  end
end
