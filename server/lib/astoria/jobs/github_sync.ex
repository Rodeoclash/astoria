defmodule Astoria.Jobs.GithubSync do
  alias Astoria.{Repo, GithubInstallations}

  def update_github_installation_rate_limits(github_installation, response) do
    if response.has_rate_limit? do
      GithubInstallations.GithubInstallation.changeset(github_installation, %{
        rate_limit_remaining: response.rate_limit_remaining,
        rate_limit_resets_at: response.rate_limit_resets_at
      })
      |> Repo.update()
    end
  end
end
