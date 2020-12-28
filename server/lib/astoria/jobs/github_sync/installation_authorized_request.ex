defmodule Astoria.Jobs.GithubSync.InstallationAuthorizedRequest do
  alias Astoria.{
    Github,
    GithubInstallationAuthorizations,
    Repo,
    Utility
  }

  alias __MODULE__

  use Oban.Worker, queue: :sync_github

  def enqueue(github_installation_authorization, payload) do
    encoded = Utility.serialise(payload)

    scheduled_at =
      GithubInstallationAuthorizations.scheduled_at(github_installation_authorization)

    %{encoded: encoded}
    |> InstallationAuthorizedRequest.new(scheduled_at: scheduled_at)
    |> Oban.insert()
  end

  def perform(%Oban.Job{args: %{"encoded" => encoded}}) do
    params =
      %{
        callback: callback,
        github_installation_authorization_id: github_installation_authorization_id,
        request: request
      } = Utility.deserialise(encoded)

    case Github.Api.V3.Request.perform(request) do
      {:ok, response} ->
        github_installation_authorization =
          Repo.get(
            GithubInstallationAuthorizations.GithubInstallationAuthorization,
            github_installation_authorization_id
          )

        if response.has_rate_limit? do
          {:ok, github_installation_authorization} =
            GithubInstallationAuthorizations.update_rate_limits(
              github_installation_authorization,
              response.rate_limit_remaining,
              response.rate_limit_resets_at
            )
        end

        callback.(params, response)

        if response.has_next_url? == true do
          scheduled_at =
            GithubInstallationAuthorizations.scheduled_at(github_installation_authorization)

          encoded =
            Map.merge(params, %{request: %{request | url: response.next_url}})
            |> Utility.serialise()

          %{"encoded" => encoded}
          |> InstallationAuthorizedRequest.new(scheduled_at: scheduled_at)
          |> Oban.insert()
        end
    end

    {:ok, :job_performed}
  end
end
