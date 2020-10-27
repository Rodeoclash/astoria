defmodule Astoria.Interactions.SyncGithubRepositoriesForGithubInstallation do
  alias Astoria.{Github}

  def perform(request) do
    Github.Api.V3.Request.perform(request)
    |> IO.inspect()
  end
end
