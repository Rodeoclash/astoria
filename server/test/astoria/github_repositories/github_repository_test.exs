defmodule Astoria.GithubRepositories.GithubRepositoryTest do
  alias Astoria.{GithubRepositories.GithubRepository}

  import Astoria.Factory
  use Astoria.DataCase

  doctest GithubRepository

  test "filter/1" do
    github_installation_1 = insert(:github_installation, %{github_id: 1})
    insert(:github_installation, %{github_id: 2})
    github_installation_3 = insert(:github_installation, %{github_id: 3})

    results = GithubRepository.filter([github_installation_1, github_installation_3])
    |> Repo.all()

    IO.inspect(results)
  end
end
