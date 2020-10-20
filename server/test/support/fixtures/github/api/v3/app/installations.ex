defmodule Astoria.Fixtures.Github.Api.V3.App.Installation do
  def list do
    %Astoria.Github.Api.V3.Response{
      data: %HTTPoison.Response{
        body: [
          %{
            "access_tokens_url" =>
              "https://api.github.com/app/installations/12367043/access_tokens",
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
            "app_id" => 84453,
            "app_slug" => "astoria-development",
            "created_at" => "2020-10-13T10:50:44.000Z",
            "events" => [],
            "html_url" => "https://github.com/settings/installations/12367043",
            "id" => 12_367_043,
            "permissions" => %{"metadata" => "read", "pull_requests" => "read"},
            "repositories_url" => "https://api.github.com/installation/repositories",
            "repository_selection" => "all",
            "single_file_name" => nil,
            "suspended_at" => nil,
            "suspended_by" => nil,
            "target_id" => 63807,
            "target_type" => "User",
            "updated_at" => "2020-10-13T10:53:41.000Z"
          }
        ],
        headers: [
          {"Date", "Tue, 20 Oct 2020 10:42:44 GMT"},
          {"Content-Type", "application/json; charset=utf-8"},
          {"Content-Length", "1499"},
          {"Server", "GitHub.com"},
          {"Status", "200 OK"},
          {"Cache-Control", "public, max-age=60, s-maxage=60"},
          {"Vary", "Accept"},
          {"ETag", "\"60e38234d97755b75a406aeaaa346d625646cf809cac2045a8032b90384011f4\""},
          {"X-GitHub-Media-Type", "github.v3; format=json"},
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
          {"X-GitHub-Request-Id", "C6B7:1B5B:8E4C7:A2639:5F8EBF24"}
        ],
        request: %HTTPoison.Request{
          body: "",
          headers: [
            {"Authorization",
             "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJKb2tlbiIsImV4cCI6MTYwMzE5MTE2MywiaWF0IjoxNjAzMTkwNTYzLCJpc3MiOiI4NDQ1MyIsImp0aSI6IjJvdnFxa24zbmJvOWNzczk3ZzAwMDE2NCIsIm5iZiI6MTYwMzE5MDU2M30.eC0GdDTlNrnlZpepN2h1d5paAvgVyDcXEJFv19bEP1WuB6ZvmDvXkaHZiScUlAz_VnpS0pplY4LBKD7A4vIPQ-hDGDpx0JFaxGrx1riWiEtuy8Mqu3Kz3jL3IRgsKFq8s37gaGFefparwGP0PAUEWAn8r1NO1yUrpbI4o2ikQprc5GOHvRBc-i9nMR5WoEw4wC3t5zgu_NuxnofCCvyZLI8gqo17tpxIkRWKNa6kSfiNueZd5_qINJLMfmXYd6fwkYmoVqRrTz0vwrK5yu4H9a14Zb-Xoo7e_G76OLqw01tALrN3Q9yH4k_G7KfPNWqq7ihvpjtODNPj8XiDO2WBaA"},
            {"Content-Type", "application/json"},
            {"Accept", "application/vnd.github.v3+json"}
          ],
          method: :get,
          options: [],
          params: %{},
          url: "https://api.github.com/app/installations"
        },
        request_url: "https://api.github.com/app/installations",
        status_code: 200
      }
    }
  end
end
