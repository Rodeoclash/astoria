defmodule Astoria.GithubInstallationAuthorizations do
  alias Astoria.{GithubInstallationAuthorizations}

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
end
