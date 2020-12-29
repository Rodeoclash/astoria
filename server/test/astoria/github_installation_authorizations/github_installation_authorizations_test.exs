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

  describe "update_rate_limits/2" do
    test "with values present" do
      github_installation_authorization = insert(:github_installation_authorization)

      assert github_installation_authorization.rate_limit_remaining == 7000
      assert github_installation_authorization.rate_limit_resets_at == ~U[3018-11-15 10:00:00Z]
      refute github_installation_authorization.rate_limit_last_updated_at

      assert {:ok, github_installation_authorization} =
               GithubInstallationAuthorizations.update_rate_limits(
                 github_installation_authorization,
                 5398,
                 ~U[2020-10-27 12:21:41Z]
               )

      assert github_installation_authorization.rate_limit_remaining == 5398
      assert github_installation_authorization.rate_limit_resets_at == ~U[2020-10-27 12:21:41Z]
      assert github_installation_authorization.rate_limit_last_updated_at
    end
  end

  describe "rate_limit_exceeded?/1" do
    test "when rate limit remaining nil" do
      github_installation_authorization =
        insert(:github_installation_authorization, %{
          rate_limit_remaining: nil
        })

      assert GithubInstallationAuthorizations.rate_limit_exceeded?(
               github_installation_authorization
             ) == false
    end

    test "when rate limit last updated at nil" do
      github_installation_authorization =
        insert(:github_installation_authorization, %{
          rate_limit_remaining: 1,
          rate_limit_last_updated_at: nil
        })

      assert GithubInstallationAuthorizations.rate_limit_exceeded?(
               github_installation_authorization
             ) == false
    end

    test "when rate limit not exceeded with old update" do
      github_installation_authorization =
        insert(:github_installation_authorization, %{
          rate_limit_last_updated_at: ~U[2020-10-27 12:21:41Z],
          rate_limit_remaining: 7500
        })

      assert GithubInstallationAuthorizations.rate_limit_exceeded?(
               github_installation_authorization
             ) == false
    end

    test "when rate limit exceeded and but no recent update" do
      github_installation_authorization =
        insert(:github_installation_authorization, %{
          rate_limit_last_updated_at: ~U[2020-10-27 12:21:41Z],
          rate_limit_remaining: 0
        })

      assert GithubInstallationAuthorizations.rate_limit_exceeded?(
               github_installation_authorization
             ) == false
    end

    test "when rate limit exceeded and recently updated" do
      github_installation_authorization =
        insert(:github_installation_authorization, %{
          rate_limit_last_updated_at: DateTime.utc_now(),
          rate_limit_remaining: 0
        })

      assert GithubInstallationAuthorizations.rate_limit_exceeded?(
               github_installation_authorization
             ) == true
    end
  end

  describe "scheduled_at/1" do
    test "when rate limit exceeded" do
      github_installation_authorization =
        insert(:github_installation_authorization, %{
          rate_limit_last_updated_at: DateTime.utc_now(),
          rate_limit_remaining: 500,
          rate_limit_resets_at: ~U[2018-11-15 10:00:00Z]
        })

      assert GithubInstallationAuthorizations.scheduled_at(github_installation_authorization) ==
               ~U[2018-11-15 10:00:05Z]
    end

    test "when rate limit not exceeded" do
      github_installation_authorization = insert(:github_installation_authorization)

      result = GithubInstallationAuthorizations.scheduled_at(github_installation_authorization)
      now = DateTime.utc_now()

      assert DateTime.compare(result, now) == :eq || DateTime.compare(result, now) == :lt
    end
  end
end
