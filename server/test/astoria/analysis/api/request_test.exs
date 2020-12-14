defmodule Astoria.Analysis.Api.RequestTest do
  alias Astoria.{Analysis, Analysis.Api.Request}
  import Mox
  use Astoria.DataCase

  doctest Request

  @response %HTTPoison.Response{
    body: "{\"data\":{\"viewer\":{\"name\":\"Samuel Richardson\"}}}"
  }

  @result %Analysis.Api.Response{
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

  test "perform/1" do
    request =
      Request.new(
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
end
