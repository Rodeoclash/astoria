defmodule Astoria.Analysis.ApiTest do
  alias Astoria.{Analysis.Api}
  import Mox
  use Astoria.DataCase

  doctest Api

  @response %HTTPoison.Response{
    body: "{\"data\":{\"viewer\":{\"name\":\"Samuel Richardson\"}}}"
  }

  @result %Api.Response{
    body: %{"data" => %{"viewer" => %{"name" => "Samuel Richardson"}}},
    poison: %HTTPoison.Response{
      body: %{"data" => %{"viewer" => %{"name" => "Samuel Richardson"}}},
      headers: [],
      request: nil,
      request_url: nil,
      status_code: nil
    },
    successful?: false
  }

  setup :verify_on_exit!

  describe "post/2" do
    test "with payload" do
      HTTPoisonMock
      |> expect(:post, fn url, payload, _headers ->
        assert url == "http://astoria-analysis:8000"
        assert payload == "123abc"

        {:ok, @response}
      end)

      assert Api.post("http://astoria-analysis:8000", "123abc") ==
               {:ok, @result}
    end

    test "without payload" do
      HTTPoisonMock
      |> expect(:post, fn url, payload, _headers ->
        assert url == "http://astoria-analysis:8000"
        assert payload == ""

        {:ok, @response}
      end)

      assert Api.post("http://astoria-analysis:8000") ==
               {:ok, @result}
    end
  end

  test "process_response/2" do
    assert Api.process_response(@response) ==
             {:ok, @result}
  end
end
