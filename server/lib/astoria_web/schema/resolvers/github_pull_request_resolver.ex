defmodule AstoriaWeb.Schema.Resolvers.GithubPullRequestResolver do
  alias Astoria.{GithubPullRequests, GithubPullRequests.GithubPullRequest, Repo}
  import Ecto.Query

  def analysis_monthly_total_change(
        github_repository,
        %{start: start, finish: finish},
        _resolution
      ) do
    data = %{
      description: "The amount and change of PRs",
      name: "PRs created this month",
      traces: nil
    }

    github_pull_requests = get_suitable_github_pull_requests(github_repository, start, finish)

    if github_pull_requests == [] do
      {:ok, data}
    else
      case GithubPullRequests.Analysis.monthly_total_change(github_pull_requests) do
        {:ok, traces} ->
          {:ok,
           Map.merge(data, %{
             traces: Jason.encode!(traces)
           })}
      end
    end
  end

  def analysis_last30_total(
        github_repository,
        %{start: start, finish: finish},
        _resolution
      ) do
    get_hero_number_data(github_repository, start, finish, :last30_total)
  end

  def analysis_merged_age(
        github_repository,
        %{start: start, finish: finish},
        _resolution
      ) do
    get_hero_number_data(github_repository, start, finish, :merged_age)
  end

  def analysis_closed_age(
        github_repository,
        %{start: start, finish: finish},
        _resolution
      ) do
    get_hero_number_data(github_repository, start, finish, :closed_age)
  end

  def analysis_opened_age(
        github_repository,
        %{start: start, finish: finish},
        _resolution
      ) do
    get_hero_number_data(github_repository, start, finish, :opened_age)
  end

  def analysis_opened_total(
        github_repository,
        %{start: start, finish: finish},
        _resolution
      ) do
    get_hero_number_data(github_repository, start, finish, :opened_total)
  end

  def analysis_changed_lines(
        github_repository,
        %{start: start, finish: finish},
        _resolution
      ) do
    get_hero_number_data(github_repository, start, finish, :changed_lines)
  end

  def analysis_merged_closed_ratio(
        github_repository,
        %{start: start, finish: finish},
        _resolution
      ) do
    get_hero_number_data(github_repository, start, finish, :merged_closed_ratio)
  end

  defp get_hero_number_data(github_repository, start, finish, name) do
    github_pull_requests = get_suitable_github_pull_requests(github_repository, start, finish)

    if github_pull_requests == [] do
      {:ok, nil}
    else
      apply(GithubPullRequests.Analysis, name, [github_pull_requests])
    end
  end

  defp get_suitable_github_pull_requests(github_repository, start, finish) do
    GithubPullRequest
    |> GithubPullRequest.where_suitable_for_analysis(github_repository.id, start, finish)
    |> select([github_pull_request], %{
      additions: fragment("?->>'additions'", github_pull_request.data),
      closed_at: fragment("?->>'closed_at'", github_pull_request.data),
      created_at: fragment("?->>'created_at'", github_pull_request.data),
      deletions: fragment("?->>'deletions'", github_pull_request.data),
      merged_at: fragment("?->>'merged_at'", github_pull_request.data)
    })
    |> Repo.all()
  end
end
