defmodule Astoria.GithubInstallations.GithubRepositoriesTest do
  alias Astoria.{GithubInstallations.GithubRepositories, Fixtures}
  import Astoria.Factory
  import Mox
  use Astoria.DataCase
  use Oban.Testing, repo: Astoria.Repo

  doctest GithubRepositories

  setup :verify_on_exit!

  test "sync/1" do
    github_installation = insert(:github_installation, %{id: 1})

    HTTPoisonMock
    |> expect(:post, fn _path, _payload, _headers ->
      {:ok, Fixtures.Github.Api.V3.App.Installations.AccessTokens.create()}
    end)

    GithubRepositories.sync(github_installation)

    assert_enqueued(
      worker: Astoria.Jobs.GithubSync.InstallationRepositories,
      args: %{
        "encoded" =>
          "g3QAAAACZAAWZ2l0aHViX2luc3RhbGxhdGlvbl9pZGEBZAAHcmVxdWVzdHQAAAAFZAAKX19zdHJ1Y3RfX2QAJEVsaXhpci5Bc3RvcmlhLkdpdGh1Yi5BcGkuVjMuUmVxdWVzdGQABmNsaWVudHQAAAADZAAKX19zdHJ1Y3RfX2QAIEVsaXhpci5Bc3RvcmlhLkdpdGh1Yi5BcGkuQ2xpZW50ZAAFdG9rZW5tAAAAK3YxLjMyOTkwYTAwZmYyYTQ2NGRmY2NkNjZiZTgxZGU3YzQxM2UzYzYwZTFkAAR0eXBlbQAAAAV0b2tlbmQABm1ldGhvZGQAA2dldGQAB3BheWxvYWR0AAAAAGQAA3VybG0AAAAwaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9pbnN0YWxsYXRpb24vcmVwb3NpdG9yaWVz"
      }
    )
  end
end
