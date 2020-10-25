defmodule Astoria.Github.Api.V3.Request do
  alias Astoria.{Github}
  alias __MODULE__

  @enforce_keys [:client, :method, :path]
  defstruct [:client, :method, :path, :payload]

  @doc ~S"""
  Create a new request struct. Once populated, this can be executed using the perform function.
  """
  @spec new(%Github.Api.Client{}, atom(), String.t(), map()) :: %Request{}
  def new(client, method, path, payload \\ %{}) do
    %Request{
      client: client,
      method: method,
      path: path,
      payload: payload
    }
  end

  @doc ~S"""
  Execute the supplied request against the Github API
  """
  @spec perform(%Request{}) :: {:ok, %Github.Api.V3.Response{}} | {:error, String.t()}
  def perform(%Request{client: client, method: method, path: path, payload: payload}) do
    with {:ok, encoded_payload} <- Jason.encode(payload) do
      case method do
        :get -> Github.Api.V3.get(client, path)
        :post -> Github.Api.V3.post(client, path, encoded_payload)
        _ -> {:error, "Unknown HTTP verb, #{method}"}
      end
    end
  end
end
