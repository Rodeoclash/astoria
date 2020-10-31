defmodule Astoria.GithubRepositoriesTest do
  alias Astoria.{GithubRepositories}

  import Astoria.Factory
  import Mox

  use Astoria.DataCase

  doctest GithubRepositories

  setup :verify_on_exit!

  test "count/0" do
    assert GithubRepositories.count() == 0
  end

  test "upsert/1" do
    github_installation = insert(:github_installation)

    assert {:ok, github_repository} =
             GithubRepositories.upsert(github_installation, %{
               "id" => 1,
             })

    assert github_repository.data == %{"id" => 1}
    assert github_repository.github_id == 1
    assert github_repository.github_installation_id == github_installation.id
  end
end

