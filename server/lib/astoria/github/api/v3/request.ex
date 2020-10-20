defmodule Astoria.Github.Api.V3.Request do
  alias Astoria.{Github}
  alias __MODULE__

  @enforce_keys [:client, :method, :path]
  defstruct [:client, :method, :path, :payload]

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
