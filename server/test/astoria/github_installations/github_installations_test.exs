defmodule Astoria.GithubInstallationsTest do
  alias Astoria.{GithubInstallations, Fixtures}

  import Astoria.Factory
  import Mox

  use Astoria.DataCase

  doctest GithubInstallations

  setup :verify_on_exit!

  test "client/1" do
    github_installation = insert(:github_installation)

    HTTPoisonMock
    |> expect(:post, fn _path, _payload, _headers ->
      {:ok, Fixtures.Github.Api.V3.App.Installations.AccessTokens.create()}
    end)

    assert {:ok, github_client} = GithubInstallations.client(github_installation)
    assert github_client.access_token == "v1.32990a00ff2a464dfccd66be81de7c413e3c60e1"
  end
end
