defmodule Astoria.Github.Api.Client do
  alias __MODULE__

  @enforce_keys [:access_token]
  defstruct [:access_token]

  def new(details) do
    %Client{access_token: details[:access_token]}
  end
end
