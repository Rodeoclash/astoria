defmodule Astoria.Analysis.Api.Endpoints.MergedClosedRatio do
  alias Astoria.{Analysis, GithubPullRequests}

  @spec create(list(%GithubPullRequests.GithubPullRequest{})) :: %Analysis.Api.Request{}
  def create(github_pull_requests) do
    Analysis.Api.Request.new(
      Path.join(Analysis.Api.endpoint(), "merged_closed_ratio"),
      github_pull_requests
    )
  end
end
