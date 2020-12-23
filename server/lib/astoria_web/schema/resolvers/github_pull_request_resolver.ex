defmodule AstoriaWeb.Schema.Resolvers.GithubPullRequestResolver do
  alias Astoria.{GithubPullRequests, GithubPullRequests.GithubPullRequest, Repo}
  import Ecto.Query

  def merged_prs_per_person(
        github_repository,
        %{period: period, start: start, finish: finish},
        _resolution
      ) do
    data = %{
      description: "Number of PRs merged per person",
      name: "Merged PRs per person",
      traces: nil
    }

    traces =
      GithubPullRequests.Traces.MergedPrsPerPerson.generate(
        github_repository,
        period,
        start,
        finish
      )

    {:ok,
     Map.merge(data, %{
       traces: Jason.encode!(traces)
     })}
  end

  def merged_prs(
        github_repository,
        %{period: period, start: start, finish: finish},
        _resolution
      ) do
    data = %{
      description: "Number of PRs merged in the period",
      name: "Merged PRs count",
      traces: nil
    }

    traces =
      GithubPullRequests.Traces.MergedPrs.generate(github_repository, period, start, finish)

    {:ok,
     Map.merge(data, %{
       traces: Jason.encode!(traces)
     })}
  end

  def average_days_pr_open_before_merge(
        github_repository,
        %{period: period, start: start, finish: finish},
        _resolution
      ) do
    data = %{
      description: "How many days a PR is open before it is merged",
      name: "Average days open before merge",
      traces: nil
    }

    traces =
      GithubPullRequests.Traces.AverageDaysPrOpenBeforeMerge.generate(
        github_repository,
        period,
        start,
        finish
      )

    {:ok,
     Map.merge(data, %{
       traces: Jason.encode!(traces)
     })}
  end

  def average_change_in_pr(
        github_repository,
        %{period: period, start: start, finish: finish},
        _resolution
      ) do
    data = %{
      description: "The average change in a PR per month",
      name: "PR change per month",
      traces: nil
    }

    traces =
      GithubPullRequests.Traces.AverageChangeInPr.generate(
        github_repository,
        period,
        start,
        finish
      )

    {:ok,
     Map.merge(data, %{
       traces: Jason.encode!(traces)
     })}
  end

  def analysis_monthly_total_change(
        github_repository,
        %{period: _period, start: start, finish: finish},
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
        %{period: _period, start: start, finish: finish},
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
        %{period: _period, start: start, finish: finish},
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
        %{period: _period, start: start, finish: finish},
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
        %{period: _period, start: start, finish: finish},
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
