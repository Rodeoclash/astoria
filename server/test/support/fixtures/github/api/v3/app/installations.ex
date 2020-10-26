defmodule Astoria.Fixtures.Github.Api.V3.App.Installations do
  def list do
    %HTTPoison.Response{
      body:
        "[{\"id\":12584411,\"account\":{\"login\":\"Rodeoclash\",\"id\":63807,\"node_id\":\"MDQ6VXNlcjYzODA3\",\"avatar_url\":\"https://avatars0.githubusercontent.com/u/63807?v=4\",\"gravatar_id\":\"\",\"url\":\"https://api.github.com/users/Rodeoclash\",\"html_url\":\"https://github.com/Rodeoclash\",\"followers_url\":\"https://api.github.com/users/Rodeoclash/followers\",\"following_url\":\"https://api.github.com/users/Rodeoclash/following{/other_user}\",\"gists_url\":\"https://api.github.com/users/Rodeoclash/gists{/gist_id}\",\"starred_url\":\"https://api.github.com/users/Rodeoclash/starred{/owner}{/repo}\",\"subscriptions_url\":\"https://api.github.com/users/Rodeoclash/subscriptions\",\"organizations_url\":\"https://api.github.com/users/Rodeoclash/orgs\",\"repos_url\":\"https://api.github.com/users/Rodeoclash/repos\",\"events_url\":\"https://api.github.com/users/Rodeoclash/events{/privacy}\",\"received_events_url\":\"https://api.github.com/users/Rodeoclash/received_events\",\"type\":\"User\",\"site_admin\":false},\"repository_selection\":\"all\",\"access_tokens_url\":\"https://api.github.com/app/installations/12584411/access_tokens\",\"repositories_url\":\"https://api.github.com/installation/repositories\",\"html_url\":\"https://github.com/settings/installations/12584411\",\"app_id\":84453,\"app_slug\":\"astoria-development\",\"target_id\":63807,\"target_type\":\"User\",\"permissions\":{\"metadata\":\"read\",\"pull_requests\":\"read\"},\"events\":[],\"created_at\":\"2020-10-25T00:22:38.000Z\",\"updated_at\":\"2020-10-25T00:22:38.000Z\",\"single_file_name\":null,\"suspended_by\":null,\"suspended_at\":null}]",
      headers: [
        {"Date", "Sun, 25 Oct 2020 00:34:35 GMT"},
        {"Content-Type", "application/json; charset=utf-8"},
        {"Content-Length", "1499"},
        {"Server", "GitHub.com"},
        {"Status", "200 OK"},
        {"Cache-Control", "public, max-age=60, s-maxage=60"},
        {"Vary", "Accept"},
        {"ETag", "\"6742a5c4681eb1ea814e03fc197b7f096fe1ef3ff43a24dbc39958533e9b1786\""},
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
        {"X-GitHub-Request-Id", "C8FB:2DCA:A1F179:B7EC4E:5F94C813"}
      ],
      request: %HTTPoison.Request{
        body: "",
        headers: [
          {"Authorization",
           "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJKb2tlbiIsImV4cCI6MTYwMzU4NjY3NSwiaWF0IjoxNjAzNTg2MDc1LCJpc3MiOiI4NDQ1MyIsImp0aSI6IjJwMGhhMmZ2b2lmdTg1cWFkazAwMDAyMiIsIm5iZiI6MTYwMzU4NjA3NX0.SdVqdWI-WmWUIvAxyoF5gHHjJzIHPpw1TMQus_0W5lkx6eCpIJK2V6eNPC-Zpvx7DiEVe4GFv82Bd6OKy254CosgJqM0CVcj-_k9GsVWBPeUC1s2X6jyZxDo0kSVbHWQUNSMeUBzBYEYI4wYOKumEV9VM_-vvPOgMsV_1Z8gx66jZTdPC1_rC3nzbbK3YAFWxDEHM-BNBw_sO0yfTNy5EJhUuA1yASMEdvRxHTDEIu-zfIWfFLooJRfS0Lb6KDK_yWuTFwTS-XRuMo7Cp3fbT_usVG_pZ5jcrWzOULf6QzEcvOi5BfkcD5H_6oPON8Qf7O-PXi6VGt8PPMYngWZVKQ"},
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
  end
end
