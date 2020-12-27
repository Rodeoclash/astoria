defmodule Astoria.GithubInstallationAuthorizations do
  alias Astoria.{GithubInstallationAuthorizations, Repo}

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
        response
      ) do
    if response.has_rate_limit? do
      GithubInstallationAuthorizations.GithubInstallationAuthorization.changeset(
        github_installation_authorization,
        %{
          rate_limit_remaining: response.rate_limit_remaining,
          rate_limit_resets_at: response.rate_limit_resets_at
        }
      )
      |> Repo.update()
    else
      {:ok, github_installation_authorization}
    end
  end
end
