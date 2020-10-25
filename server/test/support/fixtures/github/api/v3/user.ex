defmodule Astoria.Fixtures.Github.Api.V3.User do
  def get do
    %HTTPoison.Response{
      body:
        "{\"login\":\"Rodeoclash\",\"id\":63807,\"node_id\":\"MDQ6VXNlcjYzODA3\",\"avatar_url\":\"https://avatars0.githubusercontent.com/u/63807?v=4\",\"gravatar_id\":\"\",\"url\":\"https://api.github.com/users/Rodeoclash\",\"html_url\":\"https://github.com/Rodeoclash\",\"followers_url\":\"https://api.github.com/users/Rodeoclash/followers\",\"following_url\":\"https://api.github.com/users/Rodeoclash/following{/other_user}\",\"gists_url\":\"https://api.github.com/users/Rodeoclash/gists{/gist_id}\",\"starred_url\":\"https://api.github.com/users/Rodeoclash/starred{/owner}{/repo}\",\"subscriptions_url\":\"https://api.github.com/users/Rodeoclash/subscriptions\",\"organizations_url\":\"https://api.github.com/users/Rodeoclash/orgs\",\"repos_url\":\"https://api.github.com/users/Rodeoclash/repos\",\"events_url\":\"https://api.github.com/users/Rodeoclash/events{/privacy}\",\"received_events_url\":\"https://api.github.com/users/Rodeoclash/received_events\",\"type\":\"User\",\"site_admin\":false,\"name\":\"Samuel Richardson\",\"company\":null,\"blog\":\"www.richardson.co.nz\",\"location\":\"Melbourne, Australia\",\"email\":\"sam@richardson.co.nz\",\"hireable\":null,\"bio\":null,\"twitter_username\":null,\"public_repos\":26,\"public_gists\":2,\"followers\":25,\"following\":17,\"created_at\":\"2009-03-16T04:52:18Z\",\"updated_at\":\"2020-10-24T09:41:17Z\"}",
      headers: [
        {"Date", "Sat, 24 Oct 2020 09:48:56 GMT"},
        {"Content-Type", "application/json; charset=utf-8"},
        {"Content-Length", "1247"},
        {"Server", "GitHub.com"},
        {"Status", "200 OK"},
        {"Cache-Control", "private, max-age=60, s-maxage=60"},
        {"Vary", "Accept, Authorization, Cookie, X-GitHub-OTP"},
        {"ETag", "\"cbe28665a8ba5bf0c87876544dc109334092b5d5252c07666722176b0ca6d10f\""},
        {"Last-Modified", "Sat, 24 Oct 2020 09:41:17 GMT"},
        {"X-OAuth-Scopes", ""},
        {"X-Accepted-OAuth-Scopes", ""},
        {"X-OAuth-Client-Id", "Iv1.cf6ebb9fb4480eb5"},
        {"X-GitHub-Media-Type", "github.v3; format=json"},
        {"X-RateLimit-Limit", "5000"},
        {"X-RateLimit-Remaining", "4996"},
        {"X-RateLimit-Reset", "1603534500"},
        {"X-RateLimit-Used", "4"},
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
        {"X-GitHub-Request-Id", "ADB7:3CB3:8191CB:933B42:5F93F888"}
      ],
      request: %HTTPoison.Request{
        body: "",
        headers: [
          {"Authorization", "Bearer 5b3a5a10ca897efe4c67ca2798800720dfb05ce1"},
          {"Content-Type", "application/json"},
          {"Accept", "application/vnd.github.v3+json"}
        ],
        method: :get,
        options: [],
        params: %{},
        url: "https://api.github.com/user"
      },
      request_url: "https://api.github.com/user",
      status_code: 200
    }
  end
end
