defmodule Astoria.Jobs.GithubSync.InstallationAuthorizedRequest do
  alias Astoria.{
    Github,
    GithubInstallationAuthorizations,
    Repo,
    Utility
  }

  alias __MODULE__

  use Oban.Worker, queue: :sync_github

  def perform(%Oban.Job{args: %{"encoded" => encoded}}) do
    params =
      %{
        callback: callback,
        github_installation_authorization_id: github_installation_authorization_id,
        request: request
      } = Utility.deserialise(encoded)

    github_installation_authorization =
      Repo.get(
        GithubInstallationAuthorizations.GithubInstallationAuthorization,
        github_installation_authorization_id
      )

    if GithubInstallationAuthorizations.rate_limit_exceeded?(github_installation_authorization) do
      scheduled_at =
        GithubInstallationAuthorizations.scheduled_at(github_installation_authorization)

      %{"encoded" => encoded}
      |> InstallationAuthorizedRequest.new(scheduled_at: scheduled_at)
      |> Oban.insert()

      {:ok, :rate_limit_delayed}
    else
      case Github.Api.V3.Request.perform(request) do
        {:ok, response} ->
          {:ok, github_installation_authorization} =
            GithubInstallationAuthorizations.update_rate_limits(
              github_installation_authorization,
              response
            )

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
end
