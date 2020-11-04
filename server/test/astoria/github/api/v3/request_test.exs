defmodule Astoria.Github.Api.V3.RequestTest do
  alias Astoria.{Github, Github.Api.V3.Request}
  import Mox
  use Astoria.DataCase

  doctest Request

  @response %HTTPoison.Response{
    body: "{\"data\":{\"viewer\":{\"name\":\"Samuel Richardson\"}}}"
  }

  @result %Github.Api.V3.Response{
    data: %HTTPoison.Response{
      body: %{"data" => %{"viewer" => %{"name" => "Samuel Richardson"}}},
      headers: [],
      request: nil,
      request_url: nil,
      status_code: nil
    }
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
               path: "/path",
               payload: %{}
             } == Request.new(client, :get, "/path")
    end

    test "with payload", %{client: client} do
      assert %Request{
               client: client,
               method: :get,
               path: "/path",
               payload: %{"test" => "test"}
             } == Request.new(client, :get, "/path", %{"test" => "test"})
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
      |> expect(:get, fn _path, _headers ->
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
      |> expect(:post, fn _path, _headers, _payload ->
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
