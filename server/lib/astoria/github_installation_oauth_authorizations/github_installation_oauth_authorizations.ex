defmodule Astoria.GithubInstallationOauthAuthorizations do
  alias Astoria.{Github}

  def expired? do
  end

  def refresh(_github_installation_oauth_authorization) do
    # Github.Api.Client.new(:app)
    # |> Github.Api.V3.App.Installation.access_tokens(github_installation_oauth_authorization.installation_id)
  end
end
