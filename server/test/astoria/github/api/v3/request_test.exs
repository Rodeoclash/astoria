defmodule Astoria.Github.Api.V3.RequestTest do
  alias Astoria.{Github, Github.Api.V3.Request}
  import Mox
  use Astoria.DataCase

  doctest Request

  @response %HTTPoison.Response{
    body: "{\"data\":{\"viewer\":{\"name\":\"Samuel Richardson\"}}}"
  }

  @result %Github.Api.V3.Response{
    poison_response: %HTTPoison.Response{
      body: %{"data" => %{"viewer" => %{"name" => "Samuel Richardson"}}},
      headers: [],
      request: nil,
      request_url: nil,
      status_code: nil
    },
    rate_limit_remaining: nil,
    rate_limit_resets_at: nil,
    has_rate_limit?: false,
    has_next_url?: false,
    next_url: nil,
    successful?: false
  }

  setup do
    Mox.verify_on_exit!()

    client = Github.Api.Client.new("123", "bearer")

    %{client: client}
  end

  describe "new/2" do
    test "with no payload", %{client: client} do
      assert %Request{
               client: client,
               method: :get,
               payload: %{},
               url: "https://example.com",
             } == Request.new(client, :get, "https://example.com")
    end

    test "with payload", %{client: client} do
      assert %Request{
               client: client,
               method: :get,
               payload: %{"test" => "test"},
               url: "https://example.com",
             } == Request.new(client, :get, "https://example.com", %{"test" => "test"})
    end
  end

  describe "perform/2" do
    test "with get request", %{client: client} do
      request =
        Request.new(
          client,
          :get,
          "/endpoint",
          %{"payload" => "here"}
        )

      HTTPoisonMock
      |> expect(:get, fn _url, _headers ->
        {:ok, @response}
      end)

      assert Request.perform(request) ==
               {:ok, @result}
    end

    test "with post request", %{client: client} do
      request =
        Request.new(
          client,
          :post,
          "/endpoint",
          %{"payload" => "here"}
        )

      HTTPoisonMock
      |> expect(:post, fn _url, _headers, _payload ->
        {:ok, @response}
      end)

      assert Request.perform(request) ==
               {:ok, @result}
    end

    test "unknown verb", %{client: client} do
      request =
        Request.new(
          client,
          :oranges,
          "/endpoint",
          %{"payload" => "here"}
        )

      assert Request.perform(request) ==
               {:error, "Unknown HTTP verb, oranges"}
    end
  end
end
