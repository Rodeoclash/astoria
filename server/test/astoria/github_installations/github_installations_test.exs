defmodule Astoria.GithubInstallationsTest do
  alias Astoria.{GithubInstallations, Fixtures}
  import Astoria.Factory
  import Mox
  use Astoria.DataCase
  use Oban.Testing, repo: Astoria.Repo

  doctest GithubInstallations

  setup :verify_on_exit!

  test "sync/0" do
    HTTPoisonMock
    |> expect(:get, fn _path, _headers ->
      {:ok, Fixtures.Github.Api.V3.App.Installations.read_list()}
    end)
    |> expect(:post, fn _path, _payload, _headers ->
      {:ok, Fixtures.Github.Api.V3.App.Installations.AccessTokens.create()}
    end)

    GithubInstallations.sync()

    assert GithubInstallations.count() == 1
  end

  test "sync/1" do
    user =
      insert(:user, %{
        id: 1,
        email: "email@example.com"
      })

    github_user =
      insert(:github_user, %{
        id: 1,
        github_id: 1,
        user: user
      })

    github_installation =
      insert(:github_installation, %{
        id: 1,
        github_id: 1,
        github_user: github_user
      })

    GithubInstallations.sync(github_installation)

    assert_enqueued(
      worker: Astoria.Jobs.SyncGithubInstallation,
      args: %{
        "encoded" =>
          "g3QAAAABZAAHcmVxdWVzdHQAAAAFZAAKX19zdHJ1Y3RfX2QAJEVsaXhpci5Bc3RvcmlhLkdpdGh1Yi5BcGkuVjMuUmVxdWVzdGQABmNsaWVudHQAAAADZAAKX19zdHJ1Y3RfX2QAIEVsaXhpci5Bc3RvcmlhLkdpdGh1Yi5BcGkuQ2xpZW50ZAAFdG9rZW5tAAACEGV5SmhiR2NpT2lKU1V6STFOaUlzSW5SNWNDSTZJa3BYVkNKOS5leUpoZFdRaU9pSktiMnRsYmlJc0ltVjRjQ0k2TVRZd056RXpOamMwT1N3aWFXRjBJam94TmpBM01UTTJNVFE1TENKcGMzTWlPaUl4TWpNaUxDSnFkR2tpT2lJeWNEWnlNMnN3Wld3NU9XWnhhR2R6Tlc4d01EQXlZellpTENKdVltWWlPakUyTURjeE16WXhORGw5LllVSC0xU25DZGFDalVUOTEzX0hRLWRVZGtYMlB2Q0pfM2g2OEVyR2JaSjUzVlk4cks1SU1wMUpaWHBXWkNhQS1QTWN6bXFUWFlYMFI3Z0lIZzhYYmh5NkJIVTRwQWpWOXViM3MwT29sOUVXNnRDa01yMGFFWlg5YzJydHcwVm5hS0JaRlFTd0xROURyMjIyWlFzVE8xZWs0VXNUZndkQV9RcVZWdEVRajdnTXVtVEtsSTRYS1RKRENaSWR4clVyTi1xYmRZVGlzOGNmdXdKY3dwNFRiZjVfa0Y0anUyNU1uajNLcV9zVGFYMktZcWxwUXdaUEZ4WkFSTTJDYkFYcGlGcGZzRzBYOWpFVm5jTVNPeFJ0NlVCUXN2Z2ljd0FyeUxVLU8xNmt0bnRxdUVKakM0VU5IelZwTm0tZmR6aVpQbFpmemtvREJKNUR5SnJ3TnpBbEFuZ2QABHR5cGVtAAAABkJlYXJlcmQABm1ldGhvZGQAA2dldGQAB3BheWxvYWR0AAAAAGQAA3VybG0AAAAqaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9hcHAvaW5zdGFsbGF0aW9ucy8x"
      }
    )
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

  test "upsert_from_github_data/1" do
    assert {:ok, github_installation} =
             GithubInstallations.upsert_from_github_data(%{
               "id" => 1
             })

    assert github_installation.data == %{"id" => 1}
    assert github_installation.github_id == 1
  end
end
