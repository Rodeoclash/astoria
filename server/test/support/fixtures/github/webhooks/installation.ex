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

  def added do
    %{
      "action" => "added",
      "installation" => %{
        "access_tokens_url" => "https://api.github.com/app/installations/13528257/access_tokens",
        "account" => %{
          "avatar_url" => "https://avatars0.githubusercontent.com/u/56531853?v=4",
          "events_url" => "https://api.github.com/users/dasintel/events{/privacy}",
          "followers_url" => "https://api.github.com/users/dasintel/followers",
          "following_url" => "https://api.github.com/users/dasintel/following{/other_user}",
          "gists_url" => "https://api.github.com/users/dasintel/gists{/gist_id}",
          "gravatar_id" => "",
          "html_url" => "https://github.com/dasintel",
          "id" => 56_531_853,
          "login" => "dasintel",
          "node_id" => "MDEyOk9yZ2FuaXphdGlvbjU2NTMxODUz",
          "organizations_url" => "https://api.github.com/users/dasintel/orgs",
          "received_events_url" => "https://api.github.com/users/dasintel/received_events",
          "repos_url" => "https://api.github.com/users/dasintel/repos",
          "site_admin" => false,
          "starred_url" => "https://api.github.com/users/dasintel/starred{/owner}{/repo}",
          "subscriptions_url" => "https://api.github.com/users/dasintel/subscriptions",
          "type" => "Organization",
          "url" => "https://api.github.com/users/dasintel"
        },
        "app_id" => 88113,
        "app_slug" => "astoria-development-v2",
        "created_at" => "2020-12-14T21:50:28.000+11:00",
        "events" => [],
        "has_multiple_single_files" => false,
        "html_url" => "https://github.com/organizations/dasintel/settings/installations/13528257",
        "id" => 13_528_257,
        "permissions" => %{"metadata" => "read", "pull_requests" => "read"},
        "repositories_url" => "https://api.github.com/installation/repositories",
        "repository_selection" => "selected",
        "single_file_name" => nil,
        "single_file_paths" => [],
        "suspended_at" => nil,
        "suspended_by" => nil,
        "target_id" => 56_531_853,
        "target_type" => "Organization",
        "updated_at" => "2020-12-14T21:56:58.000+11:00"
      },
      "repositories_added" => [
        %{
          "full_name" => "dasintel/infra-etl",
          "id" => 288_363_289,
          "name" => "infra-etl",
          "node_id" => "MDEwOlJlcG9zaXRvcnkyODgzNjMyODk=",
          "private" => true
        }
      ],
      "repositories_removed" => [],
      "repository_selection" => "selected",
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

  def removed do
    %{
      "action" => "removed",
      "installation" => %{
        "access_tokens_url" => "https://api.github.com/app/installations/13528257/access_tokens",
        "account" => %{
          "avatar_url" => "https://avatars0.githubusercontent.com/u/56531853?v=4",
          "events_url" => "https://api.github.com/users/dasintel/events{/privacy}",
          "followers_url" => "https://api.github.com/users/dasintel/followers",
          "following_url" => "https://api.github.com/users/dasintel/following{/other_user}",
          "gists_url" => "https://api.github.com/users/dasintel/gists{/gist_id}",
          "gravatar_id" => "",
          "html_url" => "https://github.com/dasintel",
          "id" => 56_531_853,
          "login" => "dasintel",
          "node_id" => "MDEyOk9yZ2FuaXphdGlvbjU2NTMxODUz",
          "organizations_url" => "https://api.github.com/users/dasintel/orgs",
          "received_events_url" => "https://api.github.com/users/dasintel/received_events",
          "repos_url" => "https://api.github.com/users/dasintel/repos",
          "site_admin" => false,
          "starred_url" => "https://api.github.com/users/dasintel/starred{/owner}{/repo}",
          "subscriptions_url" => "https://api.github.com/users/dasintel/subscriptions",
          "type" => "Organization",
          "url" => "https://api.github.com/users/dasintel"
        },
        "app_id" => 88113,
        "app_slug" => "astoria-development-v2",
        "created_at" => "2020-12-14T10:50:28.000Z",
        "events" => [],
        "has_multiple_single_files" => false,
        "html_url" => "https://github.com/organizations/dasintel/settings/installations/13528257",
        "id" => 13_528_257,
        "permissions" => %{"metadata" => "read", "pull_requests" => "read"},
        "repositories_url" => "https://api.github.com/installation/repositories",
        "repository_selection" => "all",
        "single_file_name" => nil,
        "single_file_paths" => [],
        "suspended_at" => nil,
        "suspended_by" => nil,
        "target_id" => 56_531_853,
        "target_type" => "Organization",
        "updated_at" => "2020-12-14T10:50:29.000Z"
      },
      "repositories_added" => [],
      "repositories_removed" => [
        %{
          "full_name" => "dasintel/eloquent-interactions",
          "id" => 249_575_479,
          "name" => "eloquent-interactions",
          "node_id" => "MDEwOlJlcG9zaXRvcnkyNDk1NzU0Nzk=",
          "private" => false
        },
        %{
          "full_name" => "dasintel/go-das-data",
          "id" => 262_893_865,
          "name" => "go-das-data",
          "node_id" => "MDEwOlJlcG9zaXRvcnkyNjI4OTM4NjU=",
          "private" => true
        },
        %{
          "full_name" => "dasintel/cropping-hub-processing",
          "id" => 265_444_136,
          "name" => "cropping-hub-processing",
          "node_id" => "MDEwOlJlcG9zaXRvcnkyNjU0NDQxMzY=",
          "private" => true
        },
        %{
          "full_name" => "dasintel/R-scripts",
          "id" => 265_460_783,
          "name" => "R-scripts",
          "node_id" => "MDEwOlJlcG9zaXRvcnkyNjU0NjA3ODM=",
          "private" => true
        },
        %{
          "full_name" => "dasintel/graincast-csiro",
          "id" => 268_926_677,
          "name" => "graincast-csiro",
          "node_id" => "MDEwOlJlcG9zaXRvcnkyNjg5MjY2Nzc=",
          "private" => true
        },
        %{
          "full_name" => "dasintel/infra-etl",
          "id" => 288_363_289,
          "name" => "infra-etl",
          "node_id" => "MDEwOlJlcG9zaXRvcnkyODgzNjMyODk=",
          "private" => true
        },
        %{
          "full_name" => "dasintel/cropping-hub-mvp",
          "id" => 290_106_255,
          "name" => "cropping-hub-mvp",
          "node_id" => "MDEwOlJlcG9zaXRvcnkyOTAxMDYyNTU=",
          "private" => true
        },
        %{
          "full_name" => "dasintel/terraform-aws-elastic-beanstalk-environment",
          "id" => 311_514_921,
          "name" => "terraform-aws-elastic-beanstalk-environment",
          "node_id" => "MDEwOlJlcG9zaXRvcnkzMTE1MTQ5MjE=",
          "private" => false
        },
        %{
          "full_name" => "dasintel/coding_test",
          "id" => 311_547_759,
          "name" => "coding_test",
          "node_id" => "MDEwOlJlcG9zaXRvcnkzMTE1NDc3NTk=",
          "private" => false
        }
      ],
      "repository_selection" => "selected",
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
