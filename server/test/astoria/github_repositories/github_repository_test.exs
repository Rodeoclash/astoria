defmodule Astoria.GithubRepositories.GithubRepositoryTest do
  alias Astoria.{GithubRepositories.GithubRepository, Repo}

  import Astoria.Factory
  use Astoria.DataCase

  doctest GithubRepository

  test "filter_by_github_installation/1" do
    github_installation = insert(:github_installation)

    github_repository_1 = insert(:github_repository, github_installation: github_installation)
    github_repository_2 = insert(:github_repository)
    github_repository_3 = insert(:github_repository, github_installation: github_installation)

    results =
      GithubRepository.filter_by_github_installation_id(github_installation.id)
      |> Repo.all()

    result_ids = Enum.map(results, & &1.id)

    assert length(results) == 2
    assert Enum.member?(result_ids, github_repository_1.id)
    refute Enum.member?(result_ids, github_repository_2.id)
    assert Enum.member?(result_ids, github_repository_3.id)
  end

  test "filter_by_pub_id/1" do
    github_repository_1 = insert(:github_repository)
    github_repository_2 = insert(:github_repository)
    github_repository_3 = insert(:github_repository)

    results =
      GithubRepository.filter_by_pub_id([github_repository_1.pub_id, github_repository_3.pub_id])
      |> Repo.all()

    result_ids = Enum.map(results, & &1.id)

    assert length(results) == 2
    assert Enum.member?(result_ids, github_repository_1.id)
    refute Enum.member?(result_ids, github_repository_2.id)
    assert Enum.member?(result_ids, github_repository_3.id)
  end

  test "count/0" do
    insert(:github_repository)
    insert(:github_repository)

    result =
      GithubRepository.count()
      |> Repo.one()

    assert result == 2
  end
end
