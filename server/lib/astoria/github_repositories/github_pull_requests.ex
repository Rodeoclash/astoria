defmodule Astoria.GithubRepositories.GithubPullRequests do
  alias Astoria.{GithubInstallations, GithubRepositories, Github, Interactions, Repo}

  @doc """
  Trigger a sync of all repositories for this installation
  """
  @spec sync(%GithubRepositories.GithubRepository{}) :: :ok
  def sync(github_repository) do
    github_repository = Repo.preload(github_repository, :github_installation)

    with {:ok, client} <- GithubInstallations.client(github_repository.github_installation),
         do:
           Github.Api.V3.Repos.Pulls.read(client, %{
             full_name: github_repository.data["full_name"],
             state: "all"
           })
           |> Interactions.SyncGithubRepositoryPullRequests.perform(github_repository.id)
  end
end
