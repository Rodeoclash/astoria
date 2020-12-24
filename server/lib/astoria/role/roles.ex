defmodule Astoria.Roles do
  @roles %{
    administrator: 1,
    user: 2
  }

  @spec mapping(String.t()) :: Integer.t()
  def mapping(name) do
    @roles[name]
  end
end
