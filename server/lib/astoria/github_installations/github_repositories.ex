defmodule Astoria.GithubInstallations.GithubRepositories do
  alias Astoria.{GithubInstallations, Github, Jobs, Utility}

  @doc """
  Trigger a sync of all repositories for this installation
  """
  @spec sync(%GithubInstallations.GithubInstallation{}) :: :ok
  def sync(github_installation) do
    case GithubInstallations.client(github_installation) do
      {:ok, client} ->
        request = Github.Api.V3.Installation.Repositories.read(client)

        encoded =
          %{request: request, github_installation_id: github_installation.id}
          |> Utility.serialise()

        %{encoded: encoded}
        |> Jobs.GithubSync.InstallationRepositories.new()
        |> Oban.insert()
    end
  end
end
