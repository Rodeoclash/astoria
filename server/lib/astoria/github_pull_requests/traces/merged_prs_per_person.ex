defmodule Astoria.GithubPullRequests.Traces.MergedPrsPerPerson do
  alias Astoria.{Repo, Charts}

  def generate(github_repository, period, start, finish) do
    result =
      Repo.query!(
        """
        WITH occurances AS
        (
          SELECT
             generate_series($3::date, $4::date, '1day')::timestamp AS occured_at
        )
        ,
        users AS
        (
          SELECT DISTINCT
        (github_pull_requests.data -> 'user' ->> 'login') as name
          FROM
             github_pull_requests
          WHERE
             github_repository_id = $1
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
             ::timestamp) AS merged_at,
             github_pull_requests.data -> 'user' ->> 'login' as name
          FROM
             github_pull_requests
          WHERE
             github_repository_id = $1
          GROUP BY
             merged_at,
             name
          ORDER BY
             merged_at
        )
        SELECT
          users.name as name,
          ARRAY_AGG(occurances.occured_at) AS x,
          ARRAY_AGG(pull_requests.count) AS y
        FROM
          users
          CROSS JOIN
             occurances
          LEFT JOIN
             pull_requests
             ON pull_requests.merged_at = occurances.occured_at
             AND pull_requests.name = users.name
        GROUP BY
          users.name;
        """,
        [github_repository.id, period, start |> DateTime.to_date(), finish |> DateTime.to_date()]
      )

    Enum.map(result.rows, &Repo.load(Charts.DateIntegerTrace, {result.columns, &1}))
  end
end
