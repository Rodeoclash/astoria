defmodule Astoria.Analysis.Api.Endpoints.MonthlyTotalChange do
  alias Astoria.{Analysis}

  def create(github_pull_requests) do
    query =
      %{
        json: Jason.encode!(github_pull_requests)
      }
      |> URI.encode_query()

    Analysis.Api.Request.new(
      :post,
      Path.join(Analysis.Api.endpoint(), "monthly_total_change") <> "?" <> query
    )
  end
end
