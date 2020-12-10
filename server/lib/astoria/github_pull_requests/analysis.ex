defmodule Astoria.GithubPullRequests.Analysis do
  alias Astoria.{GithubPullRequests, Analysis}

  @doc """
  Given a list of github pull requests, send them to the analysis endpoint to calculate monthly total change.
  """
  @spec monthly_total_change(list(%GithubPullRequests.GithubPullRequest{})) :: map()
  def monthly_total_change(github_pull_requests) do
    payload =
      Enum.map(github_pull_requests, fn github_pull_request ->
        %{
          merged_at: github_pull_request.data["merged_at"]
        }
      end)

    case Analysis.Api.Endpoints.MonthlyTotalChange.create(payload)
         |> Analysis.Api.Request.perform() do
      {:ok, response} ->
        Enum.filter(response.body, &Map.has_key?(&1, "change"))
        |> Enum.sort(&(&2["date"] >= &1["date"]))
    end
  end
end
