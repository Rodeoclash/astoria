defmodule Astoria.Interactions.SyncGithubTest do
  alias Astoria.{Interactions.SyncGithub, Repo, GithubInstallations}

  import Astoria.Factory
  use Astoria.DataCase

  doctest SyncGithub

  describe "update_github_installation_rate_limits/2" do
    test "with values present" do
      github_installation = insert(:github_installation)

      response = %HTTPoison.Response{
        headers: [
          {"X-RateLimit-Limit", "5400"},
          {"X-RateLimit-Remaining", "5398"},
          {"X-RateLimit-Reset", "1603801301"},
          {"X-RateLimit-Used", "2"}
        ]
      }

      refute github_installation.rate_limit_remaining
      refute github_installation.rate_limit_resets_at

      assert {:ok, github_installation} =
               SyncGithub.update_github_installation_rate_limits(github_installation, response)

      assert github_installation.rate_limit_remaining == 5398
      assert github_installation.rate_limit_resets_at == ~U[2020-10-27 12:21:41Z]
    end

    test "with value missing" do
      github_installation = insert(:github_installation)

      response = %HTTPoison.Response{
        headers: []
      }

      refute github_installation.rate_limit_remaining
      refute github_installation.rate_limit_resets_at

      assert nil ==
               SyncGithub.update_github_installation_rate_limits(github_installation, response)

      github_installation =
        Repo.get(GithubInstallations.GithubInstallation, github_installation.id)

      refute github_installation.rate_limit_remaining
      refute github_installation.rate_limit_resets_at
    end
  end
end
