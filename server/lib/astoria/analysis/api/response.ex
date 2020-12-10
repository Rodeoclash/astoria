defmodule Astoria.Analysis.Api.Response do
  alias __MODULE__

  @enforce_keys [
    :body,
    :poison,
    :successful?
  ]
  defstruct poison: %HTTPoison.Response{}, body: nil, successful?: false

  @spec new(%HTTPoison.Response{}) :: %Response{}
  def new(poison_response) do
    %Response{
      body: poison_response.body,
      poison: poison_response,
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
