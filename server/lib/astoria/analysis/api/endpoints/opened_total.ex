defmodule Astoria.Analysis.Api.Endpoints.OpenedTotal do
  alias Astoria.{Analysis, GithubPullRequests}

  @spec create(list(%GithubPullRequests.GithubPullRequest{})) :: %Analysis.Api.Request{}
  def create(github_pull_requests) do
    Analysis.Api.Request.new(
      Path.join(Analysis.Api.endpoint(), "opened_total"),
      github_pull_requests
    )
  end
end
