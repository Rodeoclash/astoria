defmodule Astoria.Github.Api.V3.Response do
  alias __MODULE__
  @enforce_keys [:data]
  defstruct data: %{}

  @spec new(any()) :: %Response{}
  def new(data) do
    %Response{data: data}
  end

  @doc ~S"""
  Extract the remaining rate limit or nil if none present
  """
  @spec rate_limit_remaining(%Response{}) :: Integer.t()
  def rate_limit_remaining(response) do
    case List.keyfind(response.headers, "X-RateLimit-Remaining", 0) do
      nil -> nil
      {"X-RateLimit-Remaining", value} -> String.to_integer(value)
    end
  end

  @doc ~S"""
  When will this rate limit reset?
  """
  @spec rate_limit_resets_at(%Response{}) :: Integer.t()
  def rate_limit_resets_at(response) do
    case List.keyfind(response.headers, "X-RateLimit-Reset", 0) do
      nil -> nil
      {"X-RateLimit-Reset", value} -> String.to_integer(value) |> DateTime.from_unix!()
    end
  end
end
