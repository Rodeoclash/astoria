defmodule Astoria.Jobs.GithubSync.InstallationAuthorizedRequest do
  alias Astoria.{
    Github,
    GithubInstallationAuthorizations,
    GithubInstallations,
    Repo,
    Utility
  }

  alias __MODULE__

  use Oban.Worker, queue: :sync_github

  def enqueue(github_installation, payload) do
    {:ok, github_installation_authorization} =
      GithubInstallations.GithubInstallationAuthorizations.get(github_installation)

    scheduled_at =
      GithubInstallationAuthorizations.scheduled_at(github_installation_authorization)

    encoded = Utility.serialise(payload)

    %{encoded: encoded}
    |> InstallationAuthorizedRequest.new(scheduled_at: scheduled_at)
    |> Oban.insert()
  end

  def perform(%Oban.Job{args: %{"encoded" => encoded}}) do
    params =
      %{
        callback: callback,
        github_installation_id: github_installation_id,
        request: request
      } = Utility.deserialise(encoded)

    github_installation =
      Repo.get(
        GithubInstallations.GithubInstallation,
        github_installation_id
      )

    {:ok, github_installation_authorization} =
      GithubInstallations.GithubInstallationAuthorizations.get(github_installation)

    if GithubInstallationAuthorizations.rate_limit_exceeded?(github_installation_authorization) do
      enqueue(github_installation, params)
      {:ok, :rate_expiry_requeue}
    else
      # As we don't know how long the request has been in the queue use the auth we fetched earlier as it would have been refresh if needed
      client = Github.Api.Client.new(github_installation_authorization.token, "token")
      request = %{request | client: client}

      case Github.Api.V3.Request.perform(request) do
        {:ok, response} ->
          if response.has_rate_limit? do
            GithubInstallationAuthorizations.update_rate_limits(
              github_installation_authorization,
              response.rate_limit_remaining,
              response.rate_limit_resets_at
            )
          end

          callback.(params, response)

          if response.has_next_url? == true do
            payload = Map.merge(params, %{request: %{request | url: response.next_url}})

            enqueue(github_installation, payload)
          end
      end

      {:ok, :job_performed}
    end
  end
end
