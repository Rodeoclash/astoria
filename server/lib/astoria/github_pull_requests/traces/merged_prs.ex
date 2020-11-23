defmodule Astoria.GithubPullRequests.Traces.MergedPrs do
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
           COUNT(id) AS count,
           DATE_TRUNC($2,
           (
              github_pull_requests.data ->> 'merged_at'
           )
           ::timestamp) AS merged_at
        FROM
           github_pull_requests
        WHERE
           github_repository_id = $1
        GROUP BY
           merged_at
        ORDER BY
           merged_at
        )
        SELECT
        'total' AS name,
        ARRAY_AGG(days.occured_at) AS x,
        ARRAY_AGG(pull_requests.count) AS y
        FROM
        days
        LEFT JOIN
           pull_requests
           ON pull_requests.merged_at = days.occured_at
        GROUP BY
        1;
        """,
        [github_repository.id, period, start |> DateTime.to_date(), finish |> DateTime.to_date()]
      )

    Enum.map(result.rows, &Repo.load(Charts.DateIntegerTrace, {result.columns, &1}))
  end
end
