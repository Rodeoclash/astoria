defmodule Astoria.GithubInstallationsTest do
  alias Astoria.{GithubInstallations, Fixtures}

  import Astoria.Factory
  import Mox

  use Astoria.DataCase

  doctest GithubInstallations

  setup :verify_on_exit!

  test "sync/0" do
    HTTPoisonMock
    |> expect(:get, fn _path, _headers ->
      {:ok, Fixtures.Github.Api.V3.App.Installations.read()}
    end)
    |> expect(:post, fn _path, _payload, _headers ->
      {:ok, Fixtures.Github.Api.V3.App.Installations.AccessTokens.create()}
    end)

    GithubInstallations.sync()

    assert GithubInstallations.count() == 1
  end

  test "count/0" do
    assert GithubInstallations.count() == 0
  end

  test "client/1" do
    github_installation = insert(:github_installation)

    HTTPoisonMock
    |> expect(:post, fn _path, _payload, _headers ->
      {:ok, Fixtures.Github.Api.V3.App.Installations.AccessTokens.create()}
    end)

    assert {:ok, github_client} = GithubInstallations.client(github_installation)
    assert github_client.token == "v1.32990a00ff2a464dfccd66be81de7c413e3c60e1"
  end

  test "upsert/1" do
    assert {:ok, github_installation} =
             GithubInstallations.upsert(%{
               "id" => 1
             })

    assert github_installation.data == %{"id" => 1}
    assert github_installation.github_id == 1
  end
end
