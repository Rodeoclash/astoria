defmodule Astoria.GithubOauthAuthorizationsTest do
  alias Astoria.{Fixtures, GithubOauthAuthorizations}

  import Astoria.Factory
  import Mox

  use Astoria.DataCase

  doctest GithubOauthAuthorizations

  setup :verify_on_exit!

  describe "client/1" do
    test "before expiry" do
      github_oauth_authorization = insert(:github_oauth_authorization)
      assert {:ok, github_client} = GithubOauthAuthorizations.client(github_oauth_authorization)
      assert github_client.token == github_oauth_authorization.token
    end

    test "after expiry" do
      github_oauth_authorization =
        insert(:github_oauth_authorization, %{
          expires_at: 1
        })

      HTTPoisonMock
      |> expect(:post, fn _path, _payload, _headers ->
        {:ok, Fixtures.Github.Api.Oauth.create()}
      end)

      :timer.sleep(2)

      assert {:ok, github_client} = GithubOauthAuthorizations.client(github_oauth_authorization)
      assert github_client.token == "abc"
    end
  end

  describe "refresh/1" do
    test "with successful request" do
      github_oauth_authorization = insert(:github_oauth_authorization)

      HTTPoisonMock
      |> expect(:post, fn _path, _payload, _headers ->
        {:ok, Fixtures.Github.Api.Oauth.create()}
      end)

      assert {:ok, updated_github_oauth_authorization} =
               GithubOauthAuthorizations.refresh(github_oauth_authorization)

      assert updated_github_oauth_authorization.token == "abc"

      assert DateTime.compare(
               DateTime.utc_now(),
               DateTime.from_unix!(updated_github_oauth_authorization.expires_at)
             ) == :lt

      assert updated_github_oauth_authorization.refresh_token == "abc"
      assert updated_github_oauth_authorization.token_type == "bearer"
    end

    test "with unsuccessful request" do
      github_oauth_authorization = insert(:github_oauth_authorization)

      HTTPoisonMock
      |> expect(:post, fn _path, _payload, _headers ->
        {:error,
         %HTTPoison.Error{
           reason: "closed"
         }}
      end)

      assert {:error, %HTTPoison.Error{} = _response} =
               GithubOauthAuthorizations.refresh(github_oauth_authorization)
    end
  end

  describe "expired?/1" do
    test "before expiry" do
      github_oauth_authorization = insert(:github_oauth_authorization)
      refute GithubOauthAuthorizations.expired?(github_oauth_authorization)
    end

    test "after expiry" do
      github_oauth_authorization =
        insert(:github_oauth_authorization, %{
          expires_at: 1
        })

      assert GithubOauthAuthorizations.expired?(github_oauth_authorization)
    end
  end
end
