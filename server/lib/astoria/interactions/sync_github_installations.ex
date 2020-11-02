defmodule Astoria.Interactions.SyncGithubInstallations do
  alias Astoria.{Github, GithubInstallations}

  def perform(request) do
    with {:ok, response} <- Github.Api.V3.Request.perform(request),
         do: Enum.map(response.data.body, &GithubInstallations.upsert/1)
  end
end
