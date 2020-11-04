defmodule Astoria.GithubPullRequests.GithubPullRequestTest do
  alias Astoria.{GithubPullRequests.GithubPullRequest, Repo}

  import Astoria.Factory
  use Astoria.DataCase

  doctest GithubPullRequest

  test "users/0" do
    insert(:github_pull_request, %{
      data: %{
        user: %{
          login: "Name1"
        },
        created_at: ~N[2000-01-01 23:00:00]
      }
    })

    insert(:github_pull_request, %{
      data: %{
        user: %{
          login: "Name2"
        },
        created_at: ~N[2000-01-02 23:00:00]
      }
    })

    insert(:github_pull_request, %{
      data: %{
        user: %{
          login: "Name1"
        },
        created_at: ~N[2000-01-02 23:00:00]
      }
    })

    results =
      GithubPullRequest.user_summary()
      |> Repo.all()

    assert results == [
             %{
               first_seen: ~N[2000-01-01 23:00:00.000000],
               last_seen: ~N[2000-01-02 23:00:00.000000],
               name: "Name1",
               total: 2
             },
             %{
               first_seen: ~N[2000-01-02 23:00:00.000000],
               last_seen: ~N[2000-01-02 23:00:00.000000],
               name: "Name2",
               total: 1
             }
           ]
  end
end
