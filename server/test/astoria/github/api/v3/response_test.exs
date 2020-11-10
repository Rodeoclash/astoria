defmodule Astoria.Github.Api.V3.ResponseTest do
  alias Astoria.{Github.Api.V3.Response}
  use Astoria.DataCase

  doctest Response

  describe "rate_limit_remaining/1" do
    test "when header is present" do
      response = %HTTPoison.Response{
        headers: [
          {"X-RateLimit-Limit", "5400"},
          {"X-RateLimit-Remaining", "5398"},
          {"X-RateLimit-Reset", "1603801301"},
          {"X-RateLimit-Used", "2"},
        ],
      }

      assert Response.rate_limit_remaining(response) == 5398
    end

    test "when header not present" do
      response = %HTTPoison.Response{
        headers: [],
      }

      assert Response.rate_limit_remaining(response) == nil
    end
  end

  describe "rate_limit_resets_at/1" do
    test "when header is present" do
      response = %HTTPoison.Response{
        headers: [
          {"X-RateLimit-Limit", "5400"},
          {"X-RateLimit-Remaining", "5398"},
          {"X-RateLimit-Reset", "1603801301"},
          {"X-RateLimit-Used", "2"},
        ],
      }

      assert Response.rate_limit_resets_at(response) == ~U[2020-10-27 12:21:41Z]
    end

    test "when header not present" do
      response = %HTTPoison.Response{
        headers: [],
      }

      assert Response.rate_limit_remaining(response) == nil
    end
  end
end
