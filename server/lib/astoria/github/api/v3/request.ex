defmodule Astoria.Github.Api.V3.Request do
  alias Astoria.{Github}
  alias __MODULE__

  @enforce_keys [:client, :method, :url]
  defstruct [:client, :method, :url, :payload]

  @doc ~S"""
  Create a new request struct. Once populated, this can be executed using the perform function.
  """
  @spec new(%Github.Api.Client{}, atom(), String.t(), any()) :: %Request{}
  def new(client, method, url, payload \\ %{}) do
    %Request{
      client: client,
      method: method,
      payload: payload,
      url: url
    }
  end

  @doc ~S"""
  Execute the supplied request against the Github API
  """
  @spec perform(%Request{}) :: {:ok, %Github.Api.V3.Response{}} | {:error, String.t()}
  def perform(%Request{client: client, method: method, url: url, payload: payload}) do
    with {:ok, encoded_payload} <- Jason.encode(payload) do
      case method do
        :get -> Github.Api.V3.get(client, url)
        :post -> Github.Api.V3.post(client, url, encoded_payload)
        _ -> {:error, "Unknown HTTP verb, #{method}"}
      end
    end
  end
end
