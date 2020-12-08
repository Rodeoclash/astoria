defmodule Astoria.Analysis.Api.Response do
  alias __MODULE__

  @enforce_keys [
    :poison_response,
    :successful?
  ]
  defstruct poison_response: %HTTPoison.Response{},
            successful?: false

  @spec new(%HTTPoison.Response{}) :: %Response{}
  def new(poison_response) do
    %Response{
      poison_response: poison_response,
      successful?: successful?(poison_response)
    }
  end

  @doc ~S"""
  Was this request successful?
  """
  @spec successful?(%HTTPoison.Response{}) :: boolean()
  def successful?(poison_response) do
    poison_response.status_code < 300
  end
end
