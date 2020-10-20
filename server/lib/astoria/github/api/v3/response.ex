defmodule Astoria.Github.Api.V3.Response do
  alias __MODULE__
  @enforce_keys [:data]
  defstruct data: %{}

  def new(data) do
    %Response{data: data}
  end
end
