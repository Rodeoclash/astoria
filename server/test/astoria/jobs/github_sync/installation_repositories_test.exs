defmodule Astoria.Jobs.GithubSync.InstallationRepositoriesTest do
  alias Astoria.{Jobs.GithubSync.InstallationRepositories, Repo, Github, Utility, Fixtures}
  import Astoria.Factory
  import Mox
  use Astoria.DataCase
  use Oban.Testing, repo: Astoria.Repo

  doctest InstallationRepositories

  test "perform/1" do
    github_installation =
      insert(:github_installation, %{
        id: 1
      })

    client = Github.Api.Client.new("1234", "token")
    request = Github.Api.V3.Installation.Repositories.read(client)

    encoded =
      %{request: request, github_installation_id: github_installation.id}
      |> Utility.serialise()

    HTTPoisonMock
    |> expect(:post, fn _path, _payload, _headers ->
      {:ok, Fixtures.Github.Api.V3.App.Installations.AccessTokens.create()}
    end)
    |> expect(:get, fn _path, _headers ->
      {:ok, Fixtures.Github.Api.V3.Installation.Repositories.read()}
    end)
    |> expect(:get, fn _path, _headers ->
      {:ok, Fixtures.Github.Api.V3.Repos.Pulls.read_list()}
    end)
    |> expect(:get, fn _path, _headers ->
      {:ok, Fixtures.Github.Api.V3.Repos.Pulls.read_single()}
    end)

    assert :ok ==
             InstallationRepositories.perform(%Oban.Job{args: %{"encoded" => encoded}})

    assert_enqueued(
      worker: Astoria.Jobs.GithubSync.InstallationRepositories,
      args: %{
        "encoded" =>
          "g3QAAAACZAAWZ2l0aHViX2luc3RhbGxhdGlvbl9pZGEBZAAHcmVxdWVzdHQAAAAFZAAKX19zdHJ1Y3RfX2QAJEVsaXhpci5Bc3RvcmlhLkdpdGh1Yi5BcGkuVjMuUmVxdWVzdGQABmNsaWVudHQAAAADZAAKX19zdHJ1Y3RfX2QAIEVsaXhpci5Bc3RvcmlhLkdpdGh1Yi5BcGkuQ2xpZW50ZAAFdG9rZW5tAAAABDEyMzRkAAR0eXBlbQAAAAV0b2tlbmQABm1ldGhvZGQAA2dldGQAB3BheWxvYWR0AAAAAGQAA3VybG0AAABEaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9zZWFyY2gvY29kZT9xPWFkZENsYXNzK3VzZXIlM0Ftb3ppbGxhJnBhZ2U9MTU="
      }
    )
  end
end
