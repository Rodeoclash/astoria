defmodule Astoria.Github.Api.V3Test do
  alias Astoria.{Github, Github.Api.V3}
  import Mox
  use Astoria.DataCase

  doctest V3

  @response %HTTPoison.Response{
    body: "{\"data\":{\"viewer\":{\"name\":\"Samuel Richardson\"}}}"
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
               {:ok,
                %V3.Response{
                  data: %HTTPoison.Response{
                    body: %{"data" => %{"viewer" => %{"name" => "Samuel Richardson"}}},
                    headers: [],
                    request: nil,
                    request_url: nil,
                    status_code: nil
                  }
                }}
    end

    test "without payload", %{client: client} do
      HTTPoisonMock
      |> expect(:post, fn path, payload, _headers ->
        assert path == "https://api.github.com/endpoint"
        assert payload == ""

        {:ok, @response}
      end)

      assert V3.post(client, "/endpoint") ==
               {:ok,
                %V3.Response{
                  data: %HTTPoison.Response{
                    body: %{"data" => %{"viewer" => %{"name" => "Samuel Richardson"}}},
                    headers: [],
                    request: nil,
                    request_url: nil,
                    status_code: nil
                  }
                }}
    end
  end

  test "get/2", %{client: client} do
    HTTPoisonMock
    |> expect(:get, fn path, _headers ->
      assert path == "https://api.github.com/endpoint"

      {:ok, @response}
    end)

    assert V3.get(client, "/endpoint") ==
             {:ok,
              %V3.Response{
                data: %HTTPoison.Response{
                  body: %{"data" => %{"viewer" => %{"name" => "Samuel Richardson"}}},
                  headers: [],
                  request: nil,
                  request_url: nil,
                  status_code: nil
                }
              }}
  end

  test "process_response/2" do
    assert V3.process_response(@response) ==
             {:ok,
              %V3.Response{
                data: %HTTPoison.Response{
                  body: %{"data" => %{"viewer" => %{"name" => "Samuel Richardson"}}},
                  headers: [],
                  request: nil,
                  request_url: nil,
                  status_code: nil
                }
              }}
  end
end
