defmodule Astoria.GithubPullRequests.Traces.AveragePrOpenBeforeMerge do
  alias Astoria.{Repo, Charts}

  def generate(github_repository, period, start, finish) do
    result =
      Repo.query!(
        """
        WITH days AS
        (
           SELECT
              generate_series('2020-01-01 00:00:00'::timestamp, '2020-10-27 00:00:00'::timestamp, '1day')::timestamp AS occured_at
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
              AVG(DATE_PART('day', AGE((github_pull_requests.data ->> 'merged_at' )::timestamp,
              (
                 github_pull_requests.data ->> 'created_at'
              )
              ::timestamp))) AS average_days
           FROM
              github_pull_requests
           WHERE
              github_repository_id = 9
           GROUP BY
              created_at
           ORDER BY
              created_at
        )
        SELECT
           DATE_TRUNC('month', days.occured_at) AS time_period,
           AVG(average_days)
        FROM
           days
           LEFT JOIN
              pull_requests
              ON pull_requests.created_at = days.occured_at
        GROUP BY
           time_period
        ORDER BY
           time_period;
        """,
        [github_repository.id, period, start |> DateTime.to_date(), finish |> DateTime.to_date()]
      )

    Enum.map(result.rows, &Repo.load(Charts.DateIntegerTrace, {result.columns, &1}))
  end
end
