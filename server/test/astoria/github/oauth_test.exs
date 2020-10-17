defmodule Astoria.Github.OauthTest do
  alias Astoria.{GithubAuthorizations, Github}
  import Mox
  use ExUnit.Case, async: true

  doctest Github.Oauth

  setup :verify_on_exit!

  describe "tokens_from_code/3" do
    test "returns an oauth struct" do
      HTTPoisonMock
      |> expect(:post, fn _path, _payload, _headers ->
        {:ok,
         %HTTPoison.Response{
           body:
             "access_token=abc&expires_in=28800&refresh_token=abc&refresh_token_expires_in=15811200&scope=&token_type=bearer"
         }}
      end)

      assert Github.Oauth.tokens_from_code("123", "abc", "xyz") ==
               {:ok,
                %GithubAuthorizations.GithubAuthorization{
                  access_token: "abc",
                  expires_in: 28_800,
                  refresh_token: "abc",
                  refresh_token_expires_in: 15_811_200,
                  token_type: "bearer",
                  user_id: -1
                }}
    end

    test "with bad request" do
      HTTPoisonMock
      |> expect(:post, fn _path, _payload, _headers ->
        {:error, %HTTPoison.Error{id: nil, reason: :econnrefused}}
      end)

      assert Github.Oauth.tokens_from_code("123", "abc", "xyz") ==
               {:error, %HTTPoison.Error{id: nil, reason: :econnrefused}}
    end

    test "with incomplete data" do
      HTTPoisonMock
      |> expect(:post, fn _path, _payload, _headers ->
        {:ok,
         %HTTPoison.Response{
           body:
             "expires_in=28800&refresh_token=abc&refresh_token_expires_in=15811200&scope=&token_type=bearer"
         }}
      end)

      assert {:error, %Ecto.Changeset{} = changeset} =
               Github.Oauth.tokens_from_code("123", "abc", "xyz")
    end
  end
end
