defmodule Astoria.GithubRepositories.GithubRepositoryTest do
  alias Astoria.{GithubRepositories.GithubRepository, Repo}

  import Astoria.Factory
  use Astoria.DataCase

  doctest GithubRepository

  test "count/0" do
    insert(:github_repository)
    insert(:github_repository)

    result =
      GithubRepository.count()
      |> Repo.one()

    assert result == 2
  end

  test "for_user/1" do
    user = insert(:user)

    github_user =
      insert(:github_user, %{
        user: user
      })

    github_installation =
      insert(:github_installation, %{
        github_user: github_user
      })

    github_repository_1 =
      insert(:github_repository, %{
        github_installation: github_installation
      })

    github_repository_2 =
      insert(:github_repository, %{
        github_installation: github_installation
      })

    github_repository_3 = insert(:github_repository)

    results =
      GithubRepository.for_user(user.id)
      |> Repo.all()

    result_ids = Enum.map(results, & &1.id)

    assert length(results) == 2
    assert Enum.member?(result_ids, github_repository_1.id)
    assert Enum.member?(result_ids, github_repository_2.id)
    refute Enum.member?(result_ids, github_repository_3.id)
  end
end
