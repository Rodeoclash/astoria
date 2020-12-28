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
end
