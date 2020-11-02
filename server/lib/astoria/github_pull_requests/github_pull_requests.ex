defmodule Astoria.GithubPullRequests do
  alias Astoria.{GithubPullRequests, GithubRepositories, Repo}

  @doc """
  Insert data about the pull request. Will update if matches github_id.
  """
  @spec upsert(%GithubRepositories.GithubRepository{}, map()) :: :ok
  def upsert(github_repository, data) do
    %GithubPullRequests.GithubPullRequest{}
    |> GithubPullRequests.GithubPullRequest.changeset(%{
      data: data,
      github_id: data["id"],
      github_repository_id: github_repository.id
    })
    |> Repo.insert(
      on_conflict: {:replace_all_except, [:id, :pub_id]},
      conflict_target: :github_id
    )
  end
end
