defmodule Astoria.GithubRepositories.GithubRepositoryTest do
  alias Astoria.{GithubRepositories.GithubRepository, Repo}
  import Astoria.Factory
  use Astoria.DataCase

  doctest GithubRepository

  test "count/0" do
    insert(:github_repository)

    result =
      GithubRepository.count()
      |> Repo.one()

    assert result == 1
  end
end
