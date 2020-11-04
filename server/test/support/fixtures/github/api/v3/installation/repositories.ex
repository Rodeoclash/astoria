defmodule Astoria.Fixtures.Github.Api.V3.Installation.Repositories do
  def read do
    %HTTPoison.Response{
      body:
        "{ \"total_count\":1, \"repository_selection\":\"all\", \"repositories\":[ { \"id\":33462778, \"node_id\":\"MDEwOlJlcG9zaXRvcnkzMzQ2Mjc3OA==\", \"name\":\"ABCNewsCategories\", \"full_name\":\"Rodeoclash/ABCNewsCategories\", \"private\":false, \"owner\":{ \"login\":\"Rodeoclash\", \"id\":63807, \"node_id\":\"MDQ6VXNlcjYzODA3\", \"avatar_url\":\"https://avatars0.githubusercontent.com/u/63807?v=4\", \"gravatar_id\":\"\", \"url\":\"https://api.github.com/users/Rodeoclash\", \"html_url\":\"https://github.com/Rodeoclash\", \"followers_url\":\"https://api.github.com/users/Rodeoclash/followers\", \"following_url\":\"https://api.github.com/users/Rodeoclash/following{/other_user}\", \"gists_url\":\"https://api.github.com/users/Rodeoclash/gists{/gist_id}\", \"starred_url\":\"https://api.github.com/users/Rodeoclash/starred{/owner}{/repo}\", \"subscriptions_url\":\"https://api.github.com/users/Rodeoclash/subscriptions\", \"organizations_url\":\"https://api.github.com/users/Rodeoclash/orgs\", \"repos_url\":\"https://api.github.com/users/Rodeoclash/repos\", \"events_url\":\"https://api.github.com/users/Rodeoclash/events{/privacy}\", \"received_events_url\":\"https://api.github.com/users/Rodeoclash/received_events\", \"type\":\"User\", \"site_admin\":false }, \"html_url\":\"https://github.com/Rodeoclash/ABCNewsCategories\", \"description\":null, \"fork\":false, \"url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories\", \"forks_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/forks\", \"keys_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/keys{/key_id}\", \"collaborators_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/collaborators{/collaborator}\", \"teams_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/teams\", \"hooks_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/hooks\", \"issue_events_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/issues/events{/number}\", \"events_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/events\", \"assignees_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/assignees{/user}\", \"branches_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/branches{/branch}\", \"tags_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/tags\", \"blobs_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/git/blobs{/sha}\", \"git_tags_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/git/tags{/sha}\", \"git_refs_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/git/refs{/sha}\", \"trees_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/git/trees{/sha}\", \"statuses_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/statuses/{sha}\", \"languages_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/languages\", \"stargazers_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/stargazers\", \"contributors_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/contributors\", \"subscribers_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/subscribers\", \"subscription_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/subscription\", \"commits_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/commits{/sha}\", \"git_commits_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/git/commits{/sha}\", \"comments_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/comments{/number}\", \"issue_comment_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/issues/comments{/number}\", \"contents_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/contents/{+path}\", \"compare_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/compare/{base}...{head}\", \"merges_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/merges\", \"archive_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/{archive_format}{/ref}\", \"downloads_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/downloads\", \"issues_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/issues{/number}\", \"pulls_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/pulls{/number}\", \"milestones_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/milestones{/number}\", \"notifications_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/notifications{?since,all,participating}\", \"labels_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/labels{/name}\", \"releases_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/releases{/id}\", \"deployments_url\":\"https://api.github.com/repos/Rodeoclash/ABCNewsCategories/deployments\", \"created_at\":\"2015-04-06T02:14:00Z\", \"updated_at\":\"2015-04-23T11:10:14Z\", \"pushed_at\":\"2015-04-23T11:10:14Z\", \"git_url\":\"git://github.com/Rodeoclash/ABCNewsCategories.git\", \"ssh_url\":\"git@github.com:Rodeoclash/ABCNewsCategories.git\", \"clone_url\":\"https://github.com/Rodeoclash/ABCNewsCategories.git\", \"svn_url\":\"https://github.com/Rodeoclash/ABCNewsCategories\", \"homepage\":null, \"size\":2240, \"stargazers_count\":0, \"watchers_count\":0, \"language\":\"JavaScript\", \"has_issues\":true, \"has_projects\":true, \"has_downloads\":true, \"has_wiki\":true, \"has_pages\":false, \"forks_count\":0, \"mirror_url\":null, \"archived\":false, \"disabled\":false, \"open_issues_count\":0, \"license\":null, \"forks\":0, \"open_issues\":0, \"watchers\":0, \"default_branch\":\"master\", \"permissions\":{ \"admin\":false, \"push\":false, \"pull\":false } } ] }",
      headers: [
        {"Date", "Tue, 27 Oct 2020 11:25:29 GMT"},
        {"Content-Type", "application/json; charset=utf-8"},
        {"Content-Length", "141639"},
        {"Server", "GitHub.com"},
        {"Status", "200 OK"},
        {"Cache-Control", "private, max-age=60, s-maxage=60"},
        {"Vary", "Accept, Authorization, Cookie, X-GitHub-OTP"},
        {"ETag", "\"e76ecce5fff7267a931069fa8821abfcdd4bad81a891d42c8fa1bb58ac47b6ec\""},
        {"X-GitHub-Media-Type", "github.v3; format=json"},
        {"X-RateLimit-Limit", "5400"},
        {"X-RateLimit-Remaining", "5398"},
        {"X-RateLimit-Reset", "1603801301"},
        {"X-RateLimit-Used", "2"},
        {"Access-Control-Expose-Headers",
         "ETag, Link, Location, Retry-After, X-GitHub-OTP, X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Used, X-RateLimit-Reset, X-OAuth-Scopes, X-Accepted-OAuth-Scopes, X-Poll-Interval, X-GitHub-Media-Type, Deprecation, Sunset"},
        {"Access-Control-Allow-Origin", "*"},
        {"Strict-Transport-Security", "max-age=31536000; includeSubdomains; preload"},
        {"X-Frame-Options", "deny"},
        {"X-Content-Type-Options", "nosniff"},
        {"X-XSS-Protection", "1; mode=block"},
        {"Referrer-Policy", "origin-when-cross-origin, strict-origin-when-cross-origin"},
        {"Content-Security-Policy", "default-src 'none'"},
        {"Vary", "Accept-Encoding, Accept, X-Requested-With"},
        {"Vary", "Accept-Encoding"},
        {"X-GitHub-Request-Id", "9299:06FD:6A83C:7A36E:5F98038A"}
      ],
      request: %HTTPoison.Request{
        body: "",
        headers: [
          {"Authorization", "token v1.62b2bbc961fede4a0a1782009f08ea59efa18be5"},
          {"Content-Type", "application/json"},
          {"Accept", "application/vnd.github.v3+json"}
        ],
        method: :get,
        options: [],
        params: %{},
        url: "https://api.github.com/installation/repositories"
      },
      request_url: "https://api.github.com/installation/repositories",
      status_code: 200
    }
  end
end
