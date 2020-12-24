defmodule Astoria.GithubInstallations.GithubInstallationTest do
  alias Astoria.{GithubInstallations.GithubInstallation}
  import Astoria.Factory
  use Astoria.DataCase

  doctest GithubInstallation

  test "for_user/0" do
    user_github_installation = insert(:user_github_installation)

    results =
      GithubInstallation.for_user(user_github_installation.user_id)
      |> Repo.all()

    assert Enum.at(results, 0).id == user_github_installation.github_installation_id
  end
end
