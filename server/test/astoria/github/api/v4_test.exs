defmodule Astoria.Github.Api.V4Test do
  alias Astoria.{Github}
  import Mox
  use Astoria.DataCase

  doctest Github.Api.V4

  setup :verify_on_exit!

  test "perform/2" do
    client =
      Github.Api.Client.new(%{
        access_token: "123"
      })

    HTTPoisonMock
    |> expect(:post, fn _path, _payload, _headers ->
      {:ok,
       %HTTPoison.Response{
         body: "{\"data\":{\"viewer\":{\"name\":\"Samuel Richardson\"}}}"
       }}
    end)

    assert Github.Api.V4.perform(client, "123abc") ==
             {:ok,
              %Github.GraphQL.Response{
                data: %{
                  "viewer" => %{
                    "name" => "Samuel Richardson"
                  }
                }
              }}
  end
end
