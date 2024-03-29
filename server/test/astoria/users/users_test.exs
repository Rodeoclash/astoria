defmodule Astoria.UsersTest do
  alias Astoria.{Users}
  import Astoria.Factory
  use Astoria.DataCase

  doctest Users

  describe "indicate_github_installation_repositories_updated/1" do
    test "with default opts" do
      github_installation = insert(:github_installation)
      user = insert(:user)

      insert(:user_github_installation, %{
        github_installation: github_installation,
        user: user
      })

      assert [:ok] == Users.indicate_github_installation_repositories_updated(user)
    end

    test "with delayed opt" do
      github_installation = insert(:github_installation)
      user = insert(:user)

      insert(:user_github_installation, %{
        github_installation: github_installation,
        user: user
      })

      assert [:ok] == Users.indicate_github_installation_repositories_updated(user, delayed: true)
    end
  end

  describe "has_github_installations?/1" do
    test "with no installations" do
      user = insert(:user)
      refute Users.has_github_installations?(user)
    end

    test "with installations" do
      github_installation = insert(:github_installation)
      user = insert(:user)

      insert(:user_github_installation, %{
        github_installation: github_installation,
        user: user
      })

      assert Users.has_github_installations?(user)
    end
  end
end
