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

    github_pull_requests =
      GithubPullRequest
      |> GithubPullRequest.where_suitable_for_analysis(github_repository.id, start, finish)
      |> GithubPullRequest.where_merged()
      |> select([github_pull_request], %{
        merged_at: fragment("?->>'merged_at'", github_pull_request.data)
      })
      |> Repo.all()

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
    github_pull_requests =
      GithubPullRequest
      |> GithubPullRequest.where_suitable_for_analysis(github_repository.id, start, finish)
      |> GithubPullRequest.where_merged()
      |> select([github_pull_request], %{
        merged_at: fragment("?->>'merged_at'", github_pull_request.data)
      })
      |> Repo.all()

    if github_pull_requests == [] do
      {:ok, nil}
    else
      GithubPullRequests.Analysis.last30_total(github_pull_requests)
    end
  end

  def analysis_merged_age(
        github_repository,
        %{start: start, finish: finish},
        _resolution
      ) do
    github_pull_requests =
      GithubPullRequest
      |> GithubPullRequest.where_suitable_for_analysis(github_repository.id, start, finish)
      |> GithubPullRequest.where_merged()
      |> select([github_pull_request], %{
        closed_at: fragment("?->>'closed_at'", github_pull_request.data),
        created_at: fragment("?->>'created_at'", github_pull_request.data),
        merged_at: fragment("?->>'merged_at'", github_pull_request.data)
      })
      |> Repo.all()

    if github_pull_requests == [] do
      {:ok, nil}
    else
      GithubPullRequests.Analysis.merged_age(github_pull_requests)
    end
  end

  def analysis_closed_age(
        github_repository,
        %{start: start, finish: finish},
        _resolution
      ) do
    github_pull_requests =
      GithubPullRequest
      |> GithubPullRequest.where_suitable_for_analysis(github_repository.id, start, finish)
      |> GithubPullRequest.where_merged()
      |> select([github_pull_request], %{
        closed_at: fragment("?->>'closed_at'", github_pull_request.data),
        created_at: fragment("?->>'created_at'", github_pull_request.data),
        merged_at: fragment("?->>'merged_at'", github_pull_request.data)
      })
      |> Repo.all()

    if github_pull_requests == [] do
      {:ok, nil}
    else
      GithubPullRequests.Analysis.closed_age(github_pull_requests)
    end
  end

  def analysis_opened_age(
        github_repository,
        %{start: start, finish: finish},
        _resolution
      ) do
    github_pull_requests =
      GithubPullRequest
      |> GithubPullRequest.where_suitable_for_analysis(github_repository.id, start, finish)
      |> GithubPullRequest.where_merged()
      |> select([github_pull_request], %{
        closed_at: fragment("?->>'closed_at'", github_pull_request.data),
        created_at: fragment("?->>'created_at'", github_pull_request.data),
        merged_at: fragment("?->>'merged_at'", github_pull_request.data)
      })
      |> Repo.all()

    if github_pull_requests == [] do
      {:ok, nil}
    else
      GithubPullRequests.Analysis.opened_age(github_pull_requests)
    end
  end
end
