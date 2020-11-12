defmodule Astoria.Github.Api.V3.ResponseTest do
  alias Astoria.{Github.Api.V3.Response}
  use Astoria.DataCase

  doctest Response

  test "new/1" do
    poison_response = %HTTPoison.Response{
      headers: [
        {"X-RateLimit-Limit", "5400"},
        {"X-RateLimit-Remaining", "5398"},
        {"X-RateLimit-Reset", "1603801301"},
        {"X-RateLimit-Used", "2"}
      ]
    }

    assert Response.new(poison_response) == %Response{
             has_next_url?: false,
             next_url: nil,
             has_rate_limit?: true,
             poison_response: poison_response,
             rate_limit_remaining: 5398,
             rate_limit_resets_at: ~U[2020-10-27 12:21:41Z]
           }
  end

  describe "rate_limit_remaining/1" do
    test "when header is present" do
      response = %HTTPoison.Response{
        headers: [
          {"X-RateLimit-Limit", "5400"},
          {"X-RateLimit-Remaining", "5398"},
          {"X-RateLimit-Reset", "1603801301"},
          {"X-RateLimit-Used", "2"}
        ]
      }

      assert Response.rate_limit_remaining(response) == 5398
    end

    test "when header not present" do
      response = %HTTPoison.Response{
        headers: []
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
          {"X-RateLimit-Used", "2"}
        ]
      }

      assert Response.rate_limit_resets_at(response) == ~U[2020-10-27 12:21:41Z]
    end

    test "when header not present" do
      response = %HTTPoison.Response{
        headers: []
      }

      assert Response.rate_limit_remaining(response) == nil
    end
  end

  describe "next_results_url/1" do
    test "when header not present" do
      response = %HTTPoison.Response{
        headers: []
      }

      assert Response.link_results_url(response, "next") == nil
    end

    test "when header present" do
      response = %HTTPoison.Response{
        headers: [
          {"Link",
           ~S(<https://api.github.com/search/code?q=addClass+user%3Amozilla&page=15>; rel="next",
              <https://api.github.com/search/code?q=addClass+user%3Amozilla&page=34>; rel="last",
              <https://api.github.com/search/code?q=addClass+user%3Amozilla&page=1>; rel="first",
              <https://api.github.com/search/code?q=addClass+user%3Amozilla&page=13>; rel="prev")}
        ]
      }

      assert Response.link_results_url(response, "next") ==
               "https://api.github.com/search/code?q=addClass+user%3Amozilla&page=15"

      assert Response.link_results_url(response, "prev") ==
               "https://api.github.com/search/code?q=addClass+user%3Amozilla&page=13"
    end
  end
end
