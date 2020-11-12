defmodule Astoria.Interactions.SyncGithubTest do
  alias Astoria.{Interactions.SyncGithub, Repo, GithubInstallations, Github}

  import Astoria.Factory
  use Astoria.DataCase

  doctest SyncGithub

  describe "update_github_installation_rate_limits/2" do
    test "with values present" do
      github_installation = insert(:github_installation)

      response = %Github.Api.V3.Response{
        poison_response: %HTTPoison.Response{
          body: %{"data" => %{"viewer" => %{"name" => "Samuel Richardson"}}},
          headers: [],
          request: nil,
          request_url: nil,
          status_code: nil
        },
        rate_limit_remaining: 5398,
        rate_limit_resets_at: ~U[2020-10-27 12:21:41Z],
        has_rate_limit?: true,
        has_next_url?: false,
        next_url: nil
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

      response = %Github.Api.V3.Response{
        poison_response: %HTTPoison.Response{
          body: %{"data" => %{"viewer" => %{"name" => "Samuel Richardson"}}},
          headers: [],
          request: nil,
          request_url: nil,
          status_code: nil
        },
        rate_limit_remaining: nil,
        rate_limit_resets_at: nil,
        has_rate_limit?: false,
        has_next_url?: false,
        next_url: nil
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
