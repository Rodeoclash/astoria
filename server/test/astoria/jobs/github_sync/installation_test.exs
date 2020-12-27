defmodule Astoria.Jobs.GithubSync.InstallationTest do
  alias Astoria.{Jobs.GithubSync.Installation, Repo, Github, Utility, Fixtures}
  import Astoria.Factory
  import Mox
  use Astoria.DataCase
  use Oban.Testing, repo: Astoria.Repo

  doctest Installation

  test "perform/1" do
    github_installation = insert(:github_installation)

    client = Github.Api.Client.new("1234", "token")

    request =
      Github.Api.V3.App.Installations.read(client, %{
        installation_id: github_installation.github_id
      })

    encoded =
      %{request: request}
      |> Utility.serialise()

    HTTPoisonMock
    |> expect(:post, fn _path, _payload, _headers ->
      {:ok, Fixtures.Github.Api.V3.App.Installations.AccessTokens.create()}
    end)
    |> expect(:get, fn _path, _headers ->
      {:ok, Fixtures.Github.Api.V3.App.Installations.read_single()}
    end)

    assert :ok == Installation.perform(%Oban.Job{args: %{"encoded" => encoded}})
  end
end
