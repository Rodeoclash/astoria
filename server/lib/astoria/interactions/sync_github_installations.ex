defmodule Astoria.Interactions.SyncGithubInstallations do
  alias Astoria.{Github, GithubInstallations, Repo}

  def perform(request) do
    with {:ok, response} <- Github.Api.V3.Request.perform(request),
         _results <-
           Enum.each(response.data.body, fn installation_data ->
             %GithubInstallations.GithubInstallation{}
             |> GithubInstallations.GithubInstallation.changeset(%{
               data: installation_data,
               github_id: installation_data["id"]
             })
             |> Repo.insert(
               on_conflict: {:replace_all_except, [:id, :pub_id]},
               conflict_target: :github_id
             )
           end),
         do: :ok
  end
end
