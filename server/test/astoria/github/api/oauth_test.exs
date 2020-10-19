defmodule Astoria.Github.Api.OauthTest do
  alias Astoria.{Github.Api.Oauth}
  import Mox
  use Astoria.DataCase

  doctest Oauth

  setup :verify_on_exit!

  test "post/1" do
    HTTPoisonMock
    |> expect(:post, fn _path, _payload, _headers ->
      {:ok,
       %HTTPoison.Response{
         body:
           "access_token=abc&expires_in=28800&refresh_token=abc&refresh_token_expires_in=15811200&scope=&token_type=bearer"
       }}
    end)

    assert Oauth.post("123abc") == %{
             "access_token" => "abc",
             "expires_in" => "28800",
             "refresh_token" => "abc",
             "refresh_token_expires_in" => "15811200",
             "scope" => "",
             "token_type" => "bearer"
           }
  end
end
