defmodule AstoriaWeb.Schema.Resolvers.GithubPullRequestResolver do
  alias Astoria.{GithubPullRequests.GithubPullRequest, Repo}

  def merged_prs_per_person(
        github_repository,
        %{period: period, start: start, finish: finish},
        _resolution
      ) do
    {:ok,
     %{
       traces: GithubPullRequest.merged_prs_per_person(github_repository, period, start, finish)
     }}
  end

  def total_prs_merged(
        github_repository,
        %{period: period, start: start, finish: finish},
        _resolution
      ) do
    {:ok,
     %{
       traces: GithubPullRequest.total_merged_prs(github_repository, period, start, finish)
     }}
  end
end
