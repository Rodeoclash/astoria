defmodule Astoria.Fixtures.Github.Webhooks.Installation do
  def created do
    %{
      "action" => "created",
      "installation" => %{
        "access_tokens_url" => "https://api.github.com/app/installations/9955477/access_tokens",
        "account" => %{
          "avatar_url" => "https://avatars0.githubusercontent.com/u/63807?v=4",
          "events_url" => "https://api.github.com/users/Rodeoclash/events{/privacy}",
          "followers_url" => "https://api.github.com/users/Rodeoclash/followers",
          "following_url" => "https://api.github.com/users/Rodeoclash/following{/other_user}",
          "gists_url" => "https://api.github.com/users/Rodeoclash/gists{/gist_id}",
          "gravatar_id" => "",
          "html_url" => "https://github.com/Rodeoclash",
          "id" => 63807,
          "login" => "Rodeoclash",
          "node_id" => "MDQ6VXNlcjYzODA3",
          "organizations_url" => "https://api.github.com/users/Rodeoclash/orgs",
          "received_events_url" => "https://api.github.com/users/Rodeoclash/received_events",
          "repos_url" => "https://api.github.com/users/Rodeoclash/repos",
          "site_admin" => false,
          "starred_url" => "https://api.github.com/users/Rodeoclash/starred{/owner}{/repo}",
          "subscriptions_url" => "https://api.github.com/users/Rodeoclash/subscriptions",
          "type" => "User",
          "url" => "https://api.github.com/users/Rodeoclash"
        },
        "app_id" => 68146,
        "app_slug" => "gotchas-development",
        "created_at" => "2020-06-22T21:51:23.000+10:00",
        "events" => ["push"],
        "html_url" => "https://github.com/settings/installations/9955477",
        "id" => 9_955_477,
        "permissions" => %{
          "contents" => "read",
          "metadata" => "read",
          "repository_hooks" => "write",
          "statuses" => "write"
        },
        "repositories_url" => "https://api.github.com/installation/repositories",
        "repository_selection" => "all",
        "single_file_name" => nil,
        "target_id" => 63807,
        "target_type" => "User",
        "updated_at" => "2020-06-22T21:51:23.000+10:00"
      },
      "repositories" => [
        %{
          "full_name" => "Rodeoclash/Echonest-jQuery-Plugin",
          "id" => 1_218_678,
          "name" => "Echonest-jQuery-Plugin",
          "node_id" => "MDEwOlJlcG9zaXRvcnkxMjE4Njc4",
          "private" => false
        },
        %{
          "full_name" => "Rodeoclash/bors",
          "id" => 7_375_359,
          "name" => "bors",
          "node_id" => "MDEwOlJlcG9zaXRvcnk3Mzc1MzU5",
          "private" => false
        }
      ],
      "requester" => nil,
      "sender" => %{
        "avatar_url" => "https://avatars0.githubusercontent.com/u/63807?v=4",
        "events_url" => "https://api.github.com/users/Rodeoclash/events{/privacy}",
        "followers_url" => "https://api.github.com/users/Rodeoclash/followers",
        "following_url" => "https://api.github.com/users/Rodeoclash/following{/other_user}",
        "gists_url" => "https://api.github.com/users/Rodeoclash/gists{/gist_id}",
        "gravatar_id" => "",
        "html_url" => "https://github.com/Rodeoclash",
        "id" => 63807,
        "login" => "Rodeoclash",
        "node_id" => "MDQ6VXNlcjYzODA3",
        "organizations_url" => "https://api.github.com/users/Rodeoclash/orgs",
        "received_events_url" => "https://api.github.com/users/Rodeoclash/received_events",
        "repos_url" => "https://api.github.com/users/Rodeoclash/repos",
        "site_admin" => false,
        "starred_url" => "https://api.github.com/users/Rodeoclash/starred{/owner}{/repo}",
        "subscriptions_url" => "https://api.github.com/users/Rodeoclash/subscriptions",
        "type" => "User",
        "url" => "https://api.github.com/users/Rodeoclash"
      }
    }
  end

  def deleted do
    %{
      "action" => "deleted",
      "installation" => %{
        "access_tokens_url" => "https://api.github.com/app/installations/9907842/access_tokens",
        "account" => %{
          "avatar_url" => "https://avatars0.githubusercontent.com/u/63807?v=4",
          "events_url" => "https://api.github.com/users/Rodeoclash/events{/privacy}",
          "followers_url" => "https://api.github.com/users/Rodeoclash/followers",
          "following_url" => "https://api.github.com/users/Rodeoclash/following{/other_user}",
          "gists_url" => "https://api.github.com/users/Rodeoclash/gists{/gist_id}",
          "gravatar_id" => "",
          "html_url" => "https://github.com/Rodeoclash",
          "id" => 63807,
          "login" => "Rodeoclash",
          "node_id" => "MDQ6VXNlcjYzODA3",
          "organizations_url" => "https://api.github.com/users/Rodeoclash/orgs",
          "received_events_url" => "https://api.github.com/users/Rodeoclash/received_events",
          "repos_url" => "https://api.github.com/users/Rodeoclash/repos",
          "site_admin" => false,
          "starred_url" => "https://api.github.com/users/Rodeoclash/starred{/owner}{/repo}",
          "subscriptions_url" => "https://api.github.com/users/Rodeoclash/subscriptions",
          "type" => "User",
          "url" => "https://api.github.com/users/Rodeoclash"
        },
        "app_id" => 68146,
        "app_slug" => "gotchas-development",
        "created_at" => "2020-06-20T12:06:36.000Z",
        "events" => ["push"],
        "html_url" => "https://github.com/settings/installations/9907842",
        "id" => 9_907_842,
        "permissions" => %{
          "contents" => "read",
          "metadata" => "read",
          "repository_hooks" => "write",
          "statuses" => "write"
        },
        "repositories_url" => "https://api.github.com/installation/repositories",
        "repository_selection" => "all",
        "single_file_name" => nil,
        "target_id" => 63807,
        "target_type" => "User",
        "updated_at" => "2020-06-20T12:06:36.000Z"
      },
      "repositories" => [
        %{
          "full_name" => "Rodeoclash/Echonest-jQuery-Plugin",
          "id" => 1_218_678,
          "name" => "Echonest-jQuery-Plugin",
          "node_id" => "MDEwOlJlcG9zaXRvcnkxMjE4Njc4",
          "private" => false
        },
        %{
          "full_name" => "Rodeoclash/bors",
          "id" => 7_375_359,
          "name" => "bors",
          "node_id" => "MDEwOlJlcG9zaXRvcnk3Mzc1MzU5",
          "private" => false
        }
      ],
      "sender" => %{
        "avatar_url" => "https://avatars0.githubusercontent.com/u/63807?v=4",
        "events_url" => "https://api.github.com/users/Rodeoclash/events{/privacy}",
        "followers_url" => "https://api.github.com/users/Rodeoclash/followers",
        "following_url" => "https://api.github.com/users/Rodeoclash/following{/other_user}",
        "gists_url" => "https://api.github.com/users/Rodeoclash/gists{/gist_id}",
        "gravatar_id" => "",
        "html_url" => "https://github.com/Rodeoclash",
        "id" => 63807,
        "login" => "Rodeoclash",
        "node_id" => "MDQ6VXNlcjYzODA3",
        "organizations_url" => "https://api.github.com/users/Rodeoclash/orgs",
        "received_events_url" => "https://api.github.com/users/Rodeoclash/received_events",
        "repos_url" => "https://api.github.com/users/Rodeoclash/repos",
        "site_admin" => false,
        "starred_url" => "https://api.github.com/users/Rodeoclash/starred{/owner}{/repo}",
        "subscriptions_url" => "https://api.github.com/users/Rodeoclash/subscriptions",
        "type" => "User",
        "url" => "https://api.github.com/users/Rodeoclash"
      }
    }
  end
end
