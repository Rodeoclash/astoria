defmodule Astoria.GithubInstallations.GithubRepositoriesTest do
  alias Astoria.{GithubInstallations.GithubRepositories}
  import Astoria.Factory
  use Astoria.DataCase
  use Oban.Testing, repo: Astoria.Repo

  doctest GithubRepositories

  test "sync/1" do
    github_installation = insert(:github_installation, %{id: 1})

    insert(
      :github_installation_authorization,
      %{github_installation: github_installation}
    )

    GithubRepositories.sync(github_installation)

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
