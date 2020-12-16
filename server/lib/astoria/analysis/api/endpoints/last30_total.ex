defmodule Astoria.Analysis.Api.Endpoints.Last30Total do
  alias Astoria.{Analysis, GithubPullRequests}

  @spec create(list(%GithubPullRequests.GithubPullRequest{})) :: %Analysis.Api.Request{}
  def create(github_pull_requests) do
    Analysis.Api.Request.new(
      Path.join(Analysis.Api.endpoint(), "last30_total"),
      github_pull_requests
    )
  end
end
