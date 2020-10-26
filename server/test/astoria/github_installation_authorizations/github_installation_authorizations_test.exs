defmodule Astoria.GithubInstallationAuthorizationsTest do
  alias Astoria.{GithubInstallationAuthorizations}
  import Astoria.Factory
  use Astoria.DataCase

  doctest GithubInstallationAuthorizations

  describe "expired?/1" do
    test "when not expired" do
      github_installation_authorization = insert(:github_installation_authorization)
      refute GithubInstallationAuthorizations.expired?(github_installation_authorization)
    end

    test "when expired" do
      github_installation_authorization =
        insert(:github_installation_authorization, %{
          expires_at: ~N[2014-10-02 00:29:10]
        })

      assert GithubInstallationAuthorizations.expired?(github_installation_authorization)
    end
  end
end
