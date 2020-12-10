defmodule Astoria.Analysis.Api.Request do
  alias Astoria.{Analysis}
  alias __MODULE__

  @enforce_keys [:method, :url]
  defstruct [:method, :url, :payload]

  @doc ~S"""
  Create a new request struct. Once populated, this can be executed using the perform function.
  """
  @spec new(atom(), String.t(), any()) :: %Request{}
  def new(method, url, payload \\ "") do
    %Request{
      method: method,
      payload: payload,
      url: url
    }
  end

  @doc ~S"""
  Execute the supplied request against the Github API
  """
  @spec perform(%Request{}) :: {:ok, %Analysis.Api.Response{}} | {:error, String.t()}
  def perform(%Request{method: method, url: url, payload: payload}) do
    with {:ok, encoded_payload} <- Jason.encode(payload) do
      case method do
        :get -> Analysis.Api.get(url)
        :post -> Analysis.Api.post(url, encoded_payload)
        _ -> {:error, "Unknown HTTP verb, #{method}"}
      end
    end
  end
end
