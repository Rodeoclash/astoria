defmodule Astoria.GithubPullRequests.GithubPullRequest do
  alias Astoria.{GithubRepositories, Repo, Charts}
  alias __MODULE__
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "github_pull_requests" do
    belongs_to :github_repository, GithubRepositories.GithubRepository

    field :data, :map
    field :github_id, :integer
    field :pub_id, :binary_id, read_after_writes: true

    timestamps()
  end

  @doc false
  def changeset(organisation, attrs) do
    organisation
    |> cast(attrs, [:data, :github_id, :github_repository_id])
    |> validate_required([:data, :github_id, :github_repository_id])
  end

  @doc """
  Scope the query by the supplied github repository ids
  """
  def filter_by_github_repository_id(query \\ GithubPullRequest, id) do
    query
    |> where([github_pull_request], github_pull_request.github_repository_id == ^id)
  end

  @doc """
  Count the number of results
  """
  def count(query \\ GithubRepository) do
    query
    |> select([github_pull_request], count(github_pull_request.id))
  end

  @doc """
  Takes a sub query result set and converts it to a format suitable for plotly
  """
  def total_merged_prs(github_repository, period, start, finish) do
    result =
      Repo.query!("""
        WITH days AS
        (
           SELECT
              generate_series('2020-01-01'::date, '2020-10-27'::date, '1day')::timestamp AS occured_at
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
      """, [github_repository.id, period])

    Enum.map(result.rows, &Repo.load(Charts.DateIntegerTrace, {result.columns, &1}))
  end

  def merged_prs_per_person(github_repository, period, start, finish) do
    result =
      Repo.query!("""
        WITH occurances AS
        (
           SELECT
              generate_series('2020-01-01'::date, '2020-10-27'::date, '1day')::timestamp AS occured_at
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
      """, [github_repository.id, period])

    Enum.map(result.rows, &Repo.load(Charts.DateIntegerTrace, {result.columns, &1}))
  end
end
