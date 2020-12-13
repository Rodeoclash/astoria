defmodule AstoriaWeb.Schema.Resolvers.GithubPullRequestResolver do
  alias Astoria.{GithubPullRequests, GithubPullRequests.GithubPullRequest, Repo}

  def merged_prs_per_person(
        github_repository,
        %{period: period, start: start, finish: finish},
        _resolution
      ) do
    {:ok,
     %{
       traces:
         GithubPullRequests.Traces.MergedPrsPerPerson.generate(
           github_repository,
           period,
           start,
           finish
         )
     }}
  end

  def merged_prs(
        github_repository,
        %{period: period, start: start, finish: finish},
        _resolution
      ) do
    {:ok,
     %{
       traces:
         GithubPullRequests.Traces.MergedPrs.generate(github_repository, period, start, finish)
     }}
  end

  def average_days_pr_open_before_merge(
        github_repository,
        %{period: period, start: start, finish: finish},
        _resolution
      ) do
    {:ok,
     %{
       traces:
         GithubPullRequests.Traces.AverageDaysPrOpenBeforeMerge.generate(
           github_repository,
           period,
           start,
           finish
         )
     }}
  end

  def average_change_in_pr(
        github_repository,
        %{period: period, start: start, finish: finish},
        _resolution
      ) do
    {:ok,
     %{
       traces:
         GithubPullRequests.Traces.AverageChangeInPr.generate(
           github_repository,
           period,
           start,
           finish
         )
     }}
  end

  def analysis_monthly_total_change(
        github_repository,
        %{period: _period, start: start, finish: finish},
        _resolution
      ) do
    {:ok, traces} =
      case GithubPullRequest
           |> GithubPullRequest.where_repository_id(github_repository.id)
           |> GithubPullRequest.where_created_after(start)
           |> GithubPullRequest.where_created_before(finish)
           |> Repo.all() do
        results when results == [] ->
          {:ok, results}

        results ->
          GithubPullRequests.Analysis.monthly_total_change(results)
      end

    {:ok,
     %{
       traces: traces
     }}
  end
end
