defmodule Astoria.Analysis.Api.Endpoints.ClosedAge do
  alias Astoria.{Analysis, GithubPullRequests}

  @spec create(list(%GithubPullRequests.GithubPullRequest{})) :: %Analysis.Api.Request{}
  def create(github_pull_requests) do
    Analysis.Api.Request.new(
      Path.join(Analysis.Api.endpoint(), "closed_age"),
      github_pull_requests
    )
  end
end
