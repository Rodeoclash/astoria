defmodule Astoria.Github.GraphQL.Response do
  alias __MODULE__
  @enforce_keys [:data]
  defstruct data: %{}

  def new(data) do
    %Response{data: data}
  end
end
