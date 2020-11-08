defmodule AstoriaWeb.Schema.Resolvers.GithubPullRequestResolver do
  alias Astoria.{GithubPullRequests.GithubPullRequest, Repo}

  def merged_prs(github_repository, %{period: period}, _resolution) do
    traces = GithubPullRequest.filter_by_github_repository_id(GithubPullRequest, github_repository.id)
    |> GithubPullRequest.select_merged_prs(period)
    |> GithubPullRequest.source_to_traces()
    |> Repo.all()

    {:ok, %{
      traces: traces,
    }}
  end
end
