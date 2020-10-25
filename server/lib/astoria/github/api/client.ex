defmodule Astoria.Github.Api.Client do
  alias __MODULE__

  @enforce_keys [:access_token]
  defstruct [:access_token]

  @doc ~S"""
  Exchanges a Github code for access and refresh tokens
  """
  def new(access_token) do
    %Client{access_token: access_token}
  end
end
