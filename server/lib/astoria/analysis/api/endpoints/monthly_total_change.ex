defmodule Astoria.Analysis.Api.Endpoints.MonthlyTotalChange do
  alias Astoria.{Analysis}

  def create(github_pull_requests) do
    Analysis.Api.Request.new(
      Path.join(Analysis.Api.endpoint(), "monthly_total_change"),
      github_pull_requests
    )
  end
end
