defmodule Astoria.GithubInstallations.GithubRepositoriesTest do
  alias Astoria.{GithubInstallations.GithubRepositories, Github, Fixtures}
  import Astoria.Factory
  import Mox
  use Astoria.DataCase
  use Oban.Testing, repo: Astoria.Repo

  doctest GithubRepositories

  setup :verify_on_exit!

  test "enqueue_github_installation_pull_requests_sync/1" do
    github_installation = insert(:github_installation, %{id: 1})

    insert(
      :github_installation_authorization,
      %{github_installation: github_installation}
    )

    GithubRepositories.enqueue_github_installation_pull_requests_sync(github_installation)

    assert_enqueued(worker: Astoria.Jobs.GithubSync.InstallationAuthorizedRequest)
  end

  test "handle_github_installation_pull_requests_response/1" do
    github_installation = insert(:github_installation)

    response = %Github.Api.V3.Response{
      poison_response: %HTTPoison.Response{
        body: %{
          "repositories" => [
            %{
              "id" => 1
            }
          ]
        }
      },
      rate_limit_remaining: nil,
      rate_limit_resets_at: nil,
      has_rate_limit?: false,
      has_next_url?: false,
      next_url: nil,
      successful?: false
    }

    HTTPoisonMock
    |> expect(:post, fn _path, _payload, _headers ->
      {:ok, Fixtures.Github.Api.V3.App.Installations.AccessTokens.create()}
    end)

    assert :ok ==
             GithubRepositories.handle_github_installation_pull_requests_response(
               %{github_installation_id: github_installation.id},
               response
             )

    assert_enqueued(worker: Astoria.Jobs.GithubSync.InstallationAuthorizedRequest)
  end

  test "upsert/1" do
    github_installation = insert(:github_installation)

    assert {:ok, github_repository} =
             GithubRepositories.upsert(github_installation, %{
               "id" => 1
             })

    assert github_repository.data == %{"id" => 1}
    assert github_repository.github_id == 1
    assert github_repository.github_installation_id == github_installation.id
  end
end
