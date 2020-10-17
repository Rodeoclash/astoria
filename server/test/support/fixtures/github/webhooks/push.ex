defmodule Astoria.Fixtures.Github.Webhooks.Push do
  def normal do
    %{
      "after" => "8f7da5b1dcd5402bc67e5f861f110df17253bc08",
      "base_ref" => nil,
      "before" => "d820778702dfae036a4ae29bb13c9227d52fa92e",
      "commits" => [
        %{
          "added" => [],
          "author" => %{
            "email" => "sam@richardson.co.nz",
            "name" => "Sam Richardson",
            "username" => "Rodeoclash"
          },
          "committer" => %{
            "email" => "sam@richardson.co.nz",
            "name" => "Sam Richardson",
            "username" => "Rodeoclash"
          },
          "distinct" => true,
          "id" => "8f7da5b1dcd5402bc67e5f861f110df17253bc08",
          "message" => "Trigger another push event",
          "modified" => ["readme.md"],
          "removed" => [],
          "timestamp" => "2020-06-03T22:09:54+10:00",
          "tree_id" => "13234a0fd4338949d4f67a2a20f83d9ef599687d",
          "url" =>
            "https://github.com/Rodeoclash/stagehandtest/commit/8f7da5b1dcd5402bc67e5f861f110df17253bc08"
        }
      ],
      "compare" =>
        "https://github.com/Rodeoclash/stagehandtest/compare/d820778702df...8f7da5b1dcd5",
      "created" => false,
      "deleted" => false,
      "forced" => false,
      "head_commit" => %{
        "added" => [],
        "author" => %{
          "email" => "sam@richardson.co.nz",
          "name" => "Sam Richardson",
          "username" => "Rodeoclash"
        },
        "committer" => %{
          "email" => "sam@richardson.co.nz",
          "name" => "Sam Richardson",
          "username" => "Rodeoclash"
        },
        "distinct" => true,
        "id" => "8f7da5b1dcd5402bc67e5f861f110df17253bc08",
        "message" => "Trigger another push event",
        "modified" => ["readme.md"],
        "removed" => [],
        "timestamp" => "2020-06-03T22:09:54+10:00",
        "tree_id" => "13234a0fd4338949d4f67a2a20f83d9ef599687d",
        "url" =>
          "https://github.com/Rodeoclash/stagehandtest/commit/8f7da5b1dcd5402bc67e5f861f110df17253bc08"
      },
      "pusher" => %{"email" => "sam@richardson.co.nz", "name" => "Rodeoclash"},
      "ref" => "refs/heads/master",
      "repository" => %{
        "statuses_url" => "https://api.github.com/repos/Rodeoclash/stagehandtest/statuses/{sha}",
        "git_refs_url" => "https://api.github.com/repos/Rodeoclash/stagehandtest/git/refs{/sha}",
        "issue_comment_url" =>
          "https://api.github.com/repos/Rodeoclash/stagehandtest/issues/comments{/number}",
        "watchers" => 0,
        "disabled" => false,
        "mirror_url" => nil,
        "languages_url" => "https://api.github.com/repos/Rodeoclash/stagehandtest/languages",
        "stargazers_count" => 0,
        "license" => nil,
        "forks" => 0,
        "default_branch" => "master",
        "comments_url" =>
          "https://api.github.com/repos/Rodeoclash/stagehandtest/comments{/number}",
        "commits_url" => "https://api.github.com/repos/Rodeoclash/stagehandtest/commits{/sha}",
        "id" => 208_039_874,
        "clone_url" => "https://github.com/Rodeoclash/stagehandtest.git",
        "homepage" => nil,
        "stargazers_url" => "https://api.github.com/repos/Rodeoclash/stagehandtest/stargazers",
        "events_url" => "https://api.github.com/repos/Rodeoclash/stagehandtest/events",
        "blobs_url" => "https://api.github.com/repos/Rodeoclash/stagehandtest/git/blobs{/sha}",
        "forks_count" => 0,
        "pushed_at" => 1_591_186_208,
        "git_url" => "git://github.com/Rodeoclash/stagehandtest.git",
        "hooks_url" => "https://api.github.com/repos/Rodeoclash/stagehandtest/hooks",
        "owner" => %{
          "avatar_url" => "https://avatars0.githubusercontent.com/u/63807?v=4",
          "email" => "sam@richardson.co.nz",
          "events_url" => "https://api.github.com/users/Rodeoclash/events{/privacy}",
          "followers_url" => "https://api.github.com/users/Rodeoclash/followers",
          "following_url" => "https://api.github.com/users/Rodeoclash/following{/other_user}",
          "gists_url" => "https://api.github.com/users/Rodeoclash/gists{/gist_id}",
          "gravatar_id" => "",
          "html_url" => "https://github.com/Rodeoclash",
          "id" => 63807,
          "login" => "Rodeoclash",
          "name" => "Rodeoclash",
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
        "trees_url" => "https://api.github.com/repos/Rodeoclash/stagehandtest/git/trees{/sha}",
        "git_commits_url" =>
          "https://api.github.com/repos/Rodeoclash/stagehandtest/git/commits{/sha}",
        "collaborators_url" =>
          "https://api.github.com/repos/Rodeoclash/stagehandtest/collaborators{/collaborator}",
        "watchers_count" => 0,
        "archived" => false,
        "tags_url" => "https://api.github.com/repos/Rodeoclash/stagehandtest/tags",
        "merges_url" => "https://api.github.com/repos/Rodeoclash/stagehandtest/merges",
        "releases_url" => "https://api.github.com/repos/Rodeoclash/stagehandtest/releases{/id}",
        "subscribers_url" => "https://api.github.com/repos/Rodeoclash/stagehandtest/subscribers",
        "ssh_url" => "git@github.com:Rodeoclash/stagehandtest.git",
        "created_at" => 1_568_289_272,
        "name" => "stagehandtest",
        "has_issues" => true,
        "private" => false,
        "git_tags_url" => "https://api.github.com/repos/Rodeoclash/stagehandtest/git/tags{/sha}",
        "has_projects" => true,
        "archive_url" =>
          "https://api.github.com/repos/Rodeoclash/stagehandtest/{archive_format}{/ref}",
        "stargazers" => 0,
        "has_wiki" => true,
        "open_issues_count" => 0,
        "milestones_url" =>
          "https://api.github.com/repos/Rodeoclash/stagehandtest/milestones{/number}",
        "forks_url" => "https://api.github.com/repos/Rodeoclash/stagehandtest/forks",
        "url" => "https://github.com/Rodeoclash/stagehandtest",
        "downloads_url" => "https://api.github.com/repos/Rodeoclash/stagehandtest/downloads",
        "open_issues" => 0,
        "keys_url" => "https://api.github.com/repos/Rodeoclash/stagehandtest/keys{/key_id}",
        "description" => "Testing repo for Stagehand development",
        "contents_url" =>
          "https://api.github.com/repos/Rodeoclash/stagehandtest/contents/{+path}",
        "language" => "Shell",
        "contributors_url" =>
          "https://api.github.com/repos/Rodeoclash/stagehandtest/contributors",
        "deployments_url" => "https://api.github.com/repos/Rodeoclash/stagehandtest/deployments",
        "pulls_url" => "https://api.github.com/repos/Rodeoclash/stagehandtest/pulls{/number}",
        "labels_url" => "https://api.github.com/repos/Rodeoclash/stagehandtest/labels{/name}",
        "master_branch" => "master",
        "html_url" => "https://github.com/Rodeoclash/stagehandtest",
        "svn_url" => "https://github.com/Rodeoclash/stagehandtest",
        "issue_events_url" =>
          "https://api.github.com/repos/Rodeoclash/stagehandtest/issues/events{/number}",
        "notifications_url" =>
          "https://api.github.com/repos/Rodeoclash/stagehandtest/notifications{?since,all,participating}",
        "has_downloads" => true,
        "node_id" => "MDEwOlJlcG9zaXRvcnkyMDgwMzk4NzQ=",
        "compare_url" =>
          "https://api.github.com/repos/Rodeoclash/stagehandtest/compare/{base}...{head}",
        "full_name" => "Rodeoclash/stagehandtest",
        "subscription_url" =>
          "https://api.github.com/repos/Rodeoclash/stagehandtest/subscription",
        "assignees_url" =>
          "https://api.github.com/repos/Rodeoclash/stagehandtest/assignees{/user}",
        "issues_url" => "https://api.github.com/repos/Rodeoclash/stagehandtest/issues{/number}",
        "size" => 77,
        "has_pages" => false,
        "fork" => false,
        "updated_at" => "2020-06-03T12:02:47Z",
        "branches_url" =>
          "https://api.github.com/repos/Rodeoclash/stagehandtest/branches{/branch}",
        "teams_url" => "https://api.github.com/repos/Rodeoclash/stagehandtest/teams"
      },
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
