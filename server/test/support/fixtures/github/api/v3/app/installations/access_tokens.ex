defmodule Astoria.Fixtures.Github.Api.V3.App.Installations.AccessTokens do
  def create do
    %HTTPoison.Response{
      body:
        "{\"token\":\"v1.32990a00ff2a464dfccd66be81de7c413e3c60e1\",\"expires_at\":\"3020-10-25T04:14:02Z\",\"permissions\":{\"metadata\":\"read\",\"pull_requests\":\"read\"},\"repository_selection\":\"all\"}",
      headers: [
        {"Date", "Sun, 25 Oct 2020 03:14:02 GMT"},
        {"Content-Type", "application/json; charset=utf-8"},
        {"Content-Length", "177"},
        {"Server", "GitHub.com"},
        {"Status", "201 Created"},
        {"Cache-Control", "public, max-age=60, s-maxage=60"},
        {"Vary", "Accept"},
        {"ETag", "\"05e5907748598a752a4bf53ac3c239b4933bdb79c7845c064dccb2598728f840\""},
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
        {"X-GitHub-Request-Id", "EB81:4321:A127F5:B7E203:5F94ED77"}
      ],
      request: %HTTPoison.Request{
        body: "{}",
        headers: [
          {"Authorization",
           "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJKb2tlbiIsImV4cCI6MTYwMzU5NjI0MSwiaWF0IjoxNjAzNTk1NjQxLCJpc3MiOiI4NDQ1MyIsImp0aSI6IjJwMGhyZmJyZzU0OXNzczk3ZzAwMDBrMiIsIm5iZiI6MTYwMzU5NTY0MX0.qP5Faw1YY9haQ764OfiDIblzMuClHJ0iJXiu4o5HI-QlPyowADosMy-TtWm2O5BFP7awRXlL24y8O1AO3-whWkALPbKDR_FAm7ILd9lGzuOl9KzQWE7KPz6os7aQONxnH-rNAfUVy8DUYqrC3s3I0FTcRVkCCWL45fUP-53xeg4CEx4WszvhJ5t5rkb4v-fkFj-FIL4pFkM2EN9MCumAQGkF605KPCLecsoE8iETkeV3zmFSSjR6Dkt6Y4ajtt6tR1keWeEVnQj1gUzIZ-OAMTfIzWrgaMujVFBKe0JAhFwmQti7pt1neSOUUn7m4E96ng85X63oElUCDyNcOY_6jQ"},
          {"Content-Type", "application/json"},
          {"Accept", "application/vnd.github.v3+json"}
        ],
        method: :post,
        options: [],
        params: %{},
        url: "https://api.github.com/app/installations/12584411/access_tokens"
      },
      request_url: "https://api.github.com/app/installations/12584411/access_tokens",
      status_code: 201
    }
  end
end
