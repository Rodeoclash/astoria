defmodule Astoria.Analysis.Api.ResponseTest do
  alias Astoria.{Analysis.Api.Response}
  use Astoria.DataCase

  doctest Response

  test "new/1" do
    poison = %HTTPoison.Response{
      body: %{},
      headers: []
    }

    assert Response.new(poison) == %Response{
             body: poison.body,
             poison: poison,
             successful?: false
           }
  end

  describe "successful?/1" do
    test "when status code under 300" do
      response = %HTTPoison.Response{
        status_code: 200
      }

      assert Response.successful?(response) == true
    end

    test "when invalid status code" do
      response = %HTTPoison.Response{
        status_code: 500
      }

      assert Response.successful?(response) == false
    end
  end
end
