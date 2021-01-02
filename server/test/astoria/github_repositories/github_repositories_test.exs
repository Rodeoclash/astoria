defmodule Astoria.GithubRepositoriesTest do
  alias Astoria.{GithubRepositories}
  import Astoria.Factory
  use Astoria.DataCase

  doctest GithubRepositories

  test "count/0" do
    assert GithubRepositories.count() == 0
  end

  test "indicate_activity/1" do
    github_repository = insert(:github_repository)

    refute github_repository.last_activity_at
    assert {:ok, github_repository} = GithubRepositories.indicate_activity(github_repository)

    now = DateTime.utc_now()

    assert DateTime.compare(github_repository.last_activity_at, now) == :eq ||
             DateTime.compare(github_repository.last_activity_at, now) == :lt
  end
end
