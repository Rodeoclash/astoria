defmodule Astoria.Github.Api.Client do
  alias __MODULE__

  @enforce_keys [:token, :type]
  defstruct [:token, :type]

  @doc ~S"""
  Builds a client token suitable for Github access

  ## Examples

      iex> Client.new("token", "type")
      %Client{token: "token", type: "type"}

  """
  def new(token, type) do
    %Client{token: token, type: type}
  end
end
