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
end
