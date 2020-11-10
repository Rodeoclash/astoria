defmodule AstoriaWeb.Schema.Resolvers.GithubPullRequestResolver do
  alias Astoria.{GithubPullRequests.GithubPullRequest, Repo}

  def merged_prs_per_person(github_repository, %{period: period}, _resolution) do
    traces =
      GithubPullRequest.filter_by_github_repository_id(GithubPullRequest, github_repository.id)
      |> GithubPullRequest.select_merged_prs(period)
      |> GithubPullRequest.count_per_person()
      |> Repo.all()

    {:ok,
     %{
       traces: traces
     }}
  end

  def total_prs_merged(github_repository, %{period: period}, _resolution) do
    total_current_repository =
      GithubPullRequest.filter_by_github_repository_id(GithubPullRequest, github_repository.id)
      |> GithubPullRequest.select_merged_prs(period)
      |> GithubPullRequest.total_merged_prs()
      |> Repo.one()

    IO.inspect(total_current_repository)

    {:ok,
     %{
       traces: [total_current_repository]
     }}
  end
end
