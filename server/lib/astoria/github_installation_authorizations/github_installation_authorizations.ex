defmodule Astoria.GithubInstallationAuthorizations do
  alias Astoria.{GithubInstallationAuthorizations, Repo}

  @minimum_rate_limit_buffer 1000

  @doc """
  Produce a client struct suitable for accessing repos as the app
  """
  @spec expired?(%GithubInstallationAuthorizations.GithubInstallationAuthorization{}) :: boolean()
  def expired?(github_installation_authorization) do
    DateTime.compare(
      DateTime.utc_now(),
      DateTime.add(github_installation_authorization.expires_at, -60)
    ) == :gt
  end

  @doc """
  Given a github api response, update the rate limits on this auth
  """
  def update_rate_limits(
        github_installation_authorization,
        rate_limit_remaining,
        rate_limit_resets_at
      ) do
    GithubInstallationAuthorizations.GithubInstallationAuthorization.changeset(
      github_installation_authorization,
      %{
        rate_limit_remaining: rate_limit_remaining,
        rate_limit_resets_at: rate_limit_resets_at
      }
    )
    |> Repo.update()
  end

  @doc """
  Returns a DateTime that the authorization is available to be used at. Most often "now" but will be in the future if we exceed the rate limit (see the buffer at the top of the file too)
  """
  @spec rate_limit_exceeded?(%GithubInstallationAuthorizations.GithubInstallationAuthorization{}) ::
          boolean
  def rate_limit_exceeded?(github_installation_authorization) do
    github_installation_authorization.rate_limit_remaining <= @minimum_rate_limit_buffer
  end

  @doc """
  Returns a DateTime that the authorization is available to be used at. Most often "now" but will be in the future if we exceed the rate limit (see the buffer at the top of the file too)
  """
  @spec scheduled_at(%GithubInstallationAuthorizations.GithubInstallationAuthorization{}) ::
          DateTime
  def scheduled_at(github_installation_authorization) do
    if rate_limit_exceeded?(github_installation_authorization) do
      DateTime.add(github_installation_authorization.rate_limit_resets_at, 5)
    else
      DateTime.utc_now()
    end
  end
end
