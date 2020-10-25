defmodule Astoria.Interactions.SyncInstallations do
  alias Astoria.{Github, GithubInstallations}

  def perform(installations_request) do
    case Github.Api.V3.Request.perform(installations_request) do
      {:ok, response} ->
        Enum.each(response.data.body, fn installation_data ->
          #GithubInstallations.create(%{
          #  data: installation_data,
          #  github_id: installation_data["id"]
          #})
        end)
    end
  end
end
