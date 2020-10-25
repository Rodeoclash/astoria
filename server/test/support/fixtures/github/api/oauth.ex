defmodule Astoria.Fixtures.Github.Api.Oauth do
  def create do
    %HTTPoison.Response{
      body:
        "access_token=abc&expires_in=28800&refresh_token=abc&refresh_token_expires_in=15811200&scope=&token_type=bearer"
    }
  end
end
