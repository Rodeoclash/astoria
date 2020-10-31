defmodule Astoria.GithubInstallations.GithubRepositories do
  alias Astoria.{GithubInstallations, Github, Interactions}

  @doc """
  Trigger a sync of all repositories for this installation
  """
  @spec sync(%GithubInstallations.GithubInstallation{}) :: :ok
  def sync(github_installation) do
    with {:ok, client} <- GithubInstallations.client(github_installation),
         do:
           Github.Api.V3.Installation.Repositories.read(client)
           |> Interactions.SyncGithubInstallationRepositories.perform(github_installation.id)
  end
end
