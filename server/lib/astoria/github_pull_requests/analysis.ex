defmodule Astoria.GithubPullRequests.Analysis do
  alias Astoria.{GithubPullRequests, Analysis}

  @spec monthly_total_change(list(%GithubPullRequests.GithubPullRequest{})) :: map()
  def monthly_total_change(payload) do
    case Analysis.Api.Endpoints.MonthlyTotalChange.create(payload)
         |> Analysis.Api.Request.perform() do
      {:ok, response} ->
        results =
          Enum.filter(response.body, &Map.has_key?(&1, :change))
          |> Enum.sort(&(&2["date"] >= &1["date"]))
          |> Enum.reduce(
            [%{name: "total", x: [], y: []}, %{name: "change", x: [], y: []}],
            fn filtered_result, [total, change] ->
              {:ok, datetime, _} = DateTime.from_iso8601(filtered_result[:datetime] <> "Z")

              updated_total = %{
                total
                | x: total[:x] ++ [datetime],
                  y: total[:y] ++ [filtered_result[:total]]
              }

              updated_change = %{
                change
                | x: change[:x] ++ [datetime],
                  y: change[:y] ++ [filtered_result[:change]]
              }

              [updated_total, updated_change]
            end
          )

        {:ok, results}
    end
  end

  @spec last30_total(list(%GithubPullRequests.GithubPullRequest{})) :: map()
  def last30_total(payload) do
    case Analysis.Api.Endpoints.Last30Total.create(payload)
         |> Analysis.Api.Request.perform() do
      {:ok, response} ->
        {:ok, Enum.at(response.body, 0)}
    end
  end

  @spec merged_age(list(%GithubPullRequests.GithubPullRequest{})) :: map()
  def merged_age(payload) do
    case Analysis.Api.Endpoints.MergedAge.create(payload)
         |> Analysis.Api.Request.perform() do
      {:ok, response} ->
        {:ok, Enum.at(response.body, 0)}
    end
  end

  @spec closed_age(list(%GithubPullRequests.GithubPullRequest{})) :: map()
  def closed_age(payload) do
    case Analysis.Api.Endpoints.ClosedAge.create(payload)
         |> Analysis.Api.Request.perform() do
      {:ok, response} ->
        {:ok, Enum.at(response.body, 0)}
    end
  end

  @spec opened_age(list(%GithubPullRequests.GithubPullRequest{})) :: map()
  def opened_age(payload) do
    case Analysis.Api.Endpoints.OpenedAge.create(payload)
         |> Analysis.Api.Request.perform() do
      {:ok, response} ->
        {:ok, Enum.at(response.body, 0)}
    end
  end

  @spec opened_total(list(%GithubPullRequests.GithubPullRequest{})) :: map()
  def opened_total(payload) do
    case Analysis.Api.Endpoints.OpenedTotal.create(payload)
         |> Analysis.Api.Request.perform() do
      {:ok, response} ->
        {:ok, Enum.at(response.body, 0)}
    end
  end

  @spec changed_lines(list(%GithubPullRequests.GithubPullRequest{})) :: map()
  def changed_lines(payload) do
    case Analysis.Api.Endpoints.ChangedLines.create(payload)
         |> Analysis.Api.Request.perform() do
      {:ok, response} ->
        {:ok, Enum.at(response.body, 0)}
    end
  end

  @spec merged_closed_ratio(list(%GithubPullRequests.GithubPullRequest{})) :: map()
  def merged_closed_ratio(payload) do
    case Analysis.Api.Endpoints.MergedClosedRatio.create(payload)
         |> Analysis.Api.Request.perform() do
      {:ok, response} ->
        {:ok, Enum.at(response.body, 0)}
    end
  end
end
