defmodule Astoria.GithubPullRequests.Analysis do
  alias Astoria.{GithubPullRequests, Analysis}

  @doc """
  Given a list of github pull requests, send them to the analysis endpoint
  """
  @spec monthly_total_change(list(%GithubPullRequests.GithubPullRequest{})) :: map()
  def monthly_total_change(github_pull_requests) do
    payload =
      Enum.map(github_pull_requests, fn github_pull_request ->
        %{
          merged_at: github_pull_request.data["merged_at"]
        }
      end)

    IO.inspect("=== payload")
    IO.inspect(payload, limit: :infinity)

    response =
      Analysis.Api.Endpoints.MonthlyTotalChange.create(payload)
      |> Analysis.Api.Request.perform()

    IO.inspect("=== response")
    IO.inspect(response)
  end
end
