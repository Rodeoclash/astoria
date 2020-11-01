defmodule Astoria.Github.Api.Client do
  alias __MODULE__

  @enforce_keys [:token, :type]
  defstruct [:token, :type]

  @doc ~S"""
  Exchanges a Github code for access and refresh tokens

  ## Examples

      iex> Client.new("token", "type")
      %Client{token: "token", type: "type"}

  """
  def new(token, type) do
    %Client{token: token, type: type}
  end
end
