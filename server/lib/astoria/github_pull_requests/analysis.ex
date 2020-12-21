defmodule Astoria.GithubPullRequests.Analysis do
  alias Astoria.{GithubPullRequests, Analysis}

  @spec monthly_total_change(list(%GithubPullRequests.GithubPullRequest{})) :: map()
  def monthly_total_change(payload) do
    case Analysis.Api.Endpoints.MonthlyTotalChange.create(payload)
         |> Analysis.Api.Request.perform() do
      {:ok, response} ->
        results =
          Enum.filter(response.body, &Map.has_key?(&1, "change"))
          |> Enum.sort(&(&2["date"] >= &1["date"]))
          |> Enum.reduce(
            [%{name: "total", x: [], y: []}, %{name: "change", x: [], y: []}],
            fn filtered_result, [total, change] ->
              {:ok, datetime, _} = DateTime.from_iso8601(filtered_result["datetime"] <> "Z")

              updated_total = %{
                total
                | x: total[:x] ++ [datetime],
                  y: total[:y] ++ [filtered_result["total"]]
              }

              updated_change = %{
                change
                | x: change[:x] ++ [datetime],
                  y: change[:y] ++ [filtered_result["change"]]
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
        grouped_response = Enum.group_by(response.body, & &1["group"])
        change = grouped_response["current"] |> Enum.at(0) |> Map.get("change")

        change_direction =
          if change >= 0 do
            "positive"
          else
            "negative"
          end

        previous_total = grouped_response["previous"] |> Enum.at(0) |> Map.get("total")

        results = %{
          byline: "#{previous_total} last month (#{floor(change * 100)}% change)",
          change_direction: change_direction,
          value: grouped_response["current"] |> Enum.at(0) |> Map.get("total")
        }

        {:ok, results}
    end
  end
end
