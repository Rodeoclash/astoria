defmodule Astoria.Github.Api.V3.Response do
  alias __MODULE__

  @enforce_keys [
    :poison_response,
    :rate_limit_remaining,
    :rate_limit_resets_at,
    :has_rate_limit?,
    :has_next_url?,
    :next_url,
    :successful?
  ]
  defstruct poison_response: %HTTPoison.Response{},
            rate_limit_remaining: nil,
            rate_limit_resets_at: nil,
            has_rate_limit?: false,
            has_next_url?: false,
            next_url: nil,
            successful?: false

  @spec new(%HTTPoison.Response{}) :: %Response{}
  def new(poison_response) do
    rate_limit_remaining = rate_limit_remaining(poison_response)
    rate_limit_resets_at = rate_limit_resets_at(poison_response)
    next_url = link_results_url(poison_response, "next")

    has_rate_limit? = rate_limit_remaining != nil && rate_limit_resets_at != nil
    has_next_url? = next_url != nil

    %Response{
      has_next_url?: has_next_url?,
      has_rate_limit?: has_rate_limit?,
      next_url: link_results_url(poison_response, "next"),
      poison_response: poison_response,
      rate_limit_remaining: rate_limit_remaining,
      rate_limit_resets_at: rate_limit_resets_at,
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

  @doc ~S"""
  Extract the remaining rate limit or nil if none present
  """
  @spec rate_limit_remaining(%HTTPoison.Response{}) :: Integer.t()
  def rate_limit_remaining(poison_response) do
    case List.keyfind(poison_response.headers, "X-RateLimit-Remaining", 0) do
      nil -> nil
      {"X-RateLimit-Remaining", value} -> String.to_integer(value)
    end
  end

  @doc ~S"""
  When will this rate limit reset?
  """
  @spec rate_limit_resets_at(%HTTPoison.Response{}) :: Integer.t()
  def rate_limit_resets_at(poison_response) do
    case List.keyfind(poison_response.headers, "X-RateLimit-Reset", 0) do
      nil -> nil
      {"X-RateLimit-Reset", value} -> String.to_integer(value) |> DateTime.from_unix!()
    end
  end

  @doc ~S"""
  What is the next page of results?
  """
  @spec link_results_url(%HTTPoison.Response{}, String.t()) :: String.t()
  def link_results_url(poison_response, navigation) do
    case List.keyfind(poison_response.headers, "Link", 0) do
      nil ->
        nil

      {"Link", value} ->
        case ExHttpLink.parse(value) do
          {:ok, parsed_value} ->
            case Enum.find(parsed_value, nil, fn {_url, pair} ->
                   pair == {"rel", navigation}
                 end) do
              nil -> nil
              {url, _pair} -> url
            end
        end
    end
  end
end
