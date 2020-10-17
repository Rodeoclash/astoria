defmodule Astoria.Github.GraphQL.Response do
  @enforce_keys [:data]
  defstruct data: %{}
end
