defmodule AstoriaWeb.Schema.Resolvers.GithubPullRequestResolver do
  alias Astoria.{GithubPullRequests}

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
end
