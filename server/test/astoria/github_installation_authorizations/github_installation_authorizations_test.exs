defmodule Astoria.GithubInstallationAuthorizationsTest do
  alias Astoria.{GithubInstallationAuthorizations, Github}
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

  describe "update_rate_limits/2" do
    test "with values present" do
      github_installation_authorization = insert(:github_installation_authorization)

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
        next_url: nil,
        successful?: false
      }

      refute github_installation_authorization.rate_limit_remaining
      refute github_installation_authorization.rate_limit_resets_at

      assert {:ok, github_installation_authorization} =
               GithubInstallationAuthorizations.update_rate_limits(
                 github_installation_authorization,
                 response
               )

      assert github_installation_authorization.rate_limit_remaining == 5398
      assert github_installation_authorization.rate_limit_resets_at == ~U[2020-10-27 12:21:41Z]
    end

    test "with value missing" do
      github_installation_authorization = insert(:github_installation_authorization)

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
        next_url: nil,
        successful?: false
      }

      refute github_installation_authorization.rate_limit_remaining
      refute github_installation_authorization.rate_limit_resets_at

      assert {:ok, github_installation_authorization} =
               GithubInstallationAuthorizations.update_rate_limits(
                 github_installation_authorization,
                 response
               )

      refute github_installation_authorization.rate_limit_remaining
      refute github_installation_authorization.rate_limit_resets_at
    end
  end
end
