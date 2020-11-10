defmodule Astoria.Interactions.SyncGithub do
  alias Astoria.{Github, Repo, GithubInstallations}

  def update_github_installation_rate_limits(github_installation, response) do
    rate_limit_remaining = Github.Api.V3.Response.rate_limit_remaining(response)
    rate_limit_resets_at = Github.Api.V3.Response.rate_limit_resets_at(response)

    if rate_limit_remaining != nil && rate_limit_resets_at != nil do
      GithubInstallations.GithubInstallation.changeset(github_installation, %{
        rate_limit_remaining: rate_limit_remaining,
        rate_limit_resets_at: rate_limit_resets_at
      })
      |> Repo.update()
    end
  end
end
