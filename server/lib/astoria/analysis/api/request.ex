defmodule Astoria.Analysis.Api.Request do
  alias Astoria.{Analysis}
  alias __MODULE__

  @enforce_keys [:url]
  defstruct [:url, :payload]

  @doc ~S"""
  Create a new request struct. Once populated, this can be executed using the perform function.
  """
  @spec new(String.t(), any()) :: %Request{}
  def new(url, payload \\ "") do
    %Request{
      payload: payload,
      url: url
    }
  end

  @doc ~S"""
  Execute the supplied request against the analysis API
  """
  @spec perform(%Request{}) :: {:ok, %Analysis.Api.Response{}} | {:error, String.t()}
  def perform(%Request{url: url, payload: payload}) do
    with {:ok, encoded_payload} <- Jason.encode(payload) do
      Analysis.Api.post(url, encoded_payload)
    end
  end
end
