defmodule Astoria.OauthAuthorizations.GithubTest do
  alias Astoria.{OauthAuthorizations, OauthAuthorizations.Github}
  import Mox
  use Astoria.DataCase

  doctest Github

  setup :verify_on_exit!

  test "returns an oauth struct" do
    HTTPoisonMock
    |> expect(:post, fn _path, _payload, _headers ->
      {:ok,
       %HTTPoison.Response{
         body:
           "access_token=abc&expires_in=28800&refresh_token=abc&refresh_token_expires_in=15811200&scope=&token_type=bearer"
       }}
    end)

    assert {:ok, %OauthAuthorizations.OauthAuthorization{} = oauth_authorization} =
             Github.from_code("123", "abc", "xyz")

    assert oauth_authorization.access_token == "abc"
    assert oauth_authorization.expires_in == 28_800
    assert oauth_authorization.refresh_token == "abc"
    assert oauth_authorization.refresh_token_expires_in == 15811200
    assert oauth_authorization.token_type == "bearer"
  end
end
