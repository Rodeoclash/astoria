defmodule Astoria.Github.GraphQLTest do
  alias Astoria.{Github}
  import Mox
  use ExUnit.Case, async: false

  doctest Github.GraphQL

  setup :verify_on_exit!

  describe "query/2" do
    test "returns a graphql struct containing the query response" do
      HTTPoisonMock
      |> expect(:post, fn _path, _payload, _headers ->
        {:ok,
         %HTTPoison.Response{
           body: "{\"data\":{\"viewer\":{\"name\":\"Samuel Richardson\"}}}"
         }}
      end)

      assert Github.GraphQL.query("123abc", "") ==
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
end
