defmodule Astoria.Jobs.GithubSync.InstallationsTest do
  alias Astoria.{Jobs.GithubSync.Installations, Repo, Github, Utility, Fixtures}
  import Mox
  use Astoria.DataCase
  use Oban.Testing, repo: Astoria.Repo

  doctest Installations

  test "perform/1" do
    client = Github.Api.Client.new("1234", "token")

    request = Github.Api.V3.App.Installations.read(client)

    encoded =
      %{request: request}
      |> Utility.serialise()

    HTTPoisonMock
    |> expect(:post, fn _path, _payload, _headers ->
      {:ok, Fixtures.Github.Api.V3.App.Installations.AccessTokens.create()}
    end)
    |> expect(:get, fn _path, _headers ->
      {:ok, Fixtures.Github.Api.V3.App.Installations.read_list()}
    end)

    assert :ok == Installations.perform(%Oban.Job{args: %{"encoded" => encoded}})
  end
end
