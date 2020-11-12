defmodule Astoria.Github.Api.V3Test do
  alias Astoria.{Github, Github.Api.V3}
  import Mox
  use Astoria.DataCase

  doctest V3

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
    next_url: nil
  }

  setup do
    Mox.verify_on_exit!()

    client = Github.Api.Client.new("123", "bearer")

    %{client: client}
  end

  describe "post/2" do
    test "with payload", %{client: client} do
      HTTPoisonMock
      |> expect(:post, fn path, payload, _headers ->
        assert path == "https://api.github.com/endpoint"
        assert payload == "123abc"

        {:ok, @response}
      end)

      assert V3.post(client, "/endpoint", "123abc") ==
               {:ok, @result}
    end

    test "without payload", %{client: client} do
      HTTPoisonMock
      |> expect(:post, fn path, payload, _headers ->
        assert path == "https://api.github.com/endpoint"
        assert payload == ""

        {:ok, @response}
      end)

      assert V3.post(client, "/endpoint") ==
               {:ok, @result}
    end
  end

  test "get/2", %{client: client} do
    HTTPoisonMock
    |> expect(:get, fn path, _headers ->
      assert path == "https://api.github.com/endpoint"

      {:ok, @response}
    end)

    assert V3.get(client, "/endpoint") ==
             {:ok, @result}
  end

  test "process_response/2" do
    assert V3.process_response(@response) ==
             {:ok, @result}
  end
end
