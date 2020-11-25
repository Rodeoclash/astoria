defmodule Astoria.GithubPullRequests.Traces.AverageChangeInPr do
  alias Astoria.{Repo, Charts}

  def generate(github_repository, period, start, finish) do
    result =
      Repo.query!(
        """
        WITH days AS
        (
           SELECT
              generate_series($3::date, $4::date, '1day')::timestamp AS occured_at
        )
        ,
        pull_requests AS
        (
           SELECT
              DATE_TRUNC('day',
              (
                 github_pull_requests.data ->> 'created_at'
              )
              ::timestamp) AS created_at,
              AVG((github_pull_requests.data ->> 'additions')::integer + (github_pull_requests.data ->> 'deletions')::integer)::float AS average_change
           FROM
              github_pull_requests
           WHERE
              github_repository_id = $1
           GROUP BY
              created_at
           ORDER BY
              created_at
        )
        ,
        results AS
        (
           SELECT
              DATE_TRUNC($2, days.occured_at) AS time_period,
              AVG(average_change) AS average_change
           FROM
              days
              LEFT JOIN
                 pull_requests
                 ON pull_requests.created_at = days.occured_at
           GROUP BY
              time_period
           ORDER BY
              time_period
        )
        SELECT
           'average' AS name,
           ARRAY_AGG(results.time_period) AS x,
           ARRAY_AGG(results.average_change) AS y
        FROM
           results
        GROUP BY
           1;
        """,
        [github_repository.id, period, start |> DateTime.to_date(), finish |> DateTime.to_date()]
      )

    IO.inspect "=== results"
    IO.inspect result

    Enum.map(result.rows, &Repo.load(Charts.DateFloatTrace, {result.columns, &1}))
  end
end
