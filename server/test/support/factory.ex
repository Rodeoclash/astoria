defmodule Astoria.Factory do
  use ExMachina.Ecto, repo: Astoria.Repo

  def user_factory do
    %Astoria.Users.User{
      email: sequence(:email, &"email-#{&1}@example.com"),
      name: "Hicks"
    }
  end

  def github_oauth_authorization_factory do
    %Astoria.GithubOauthAuthorizations.GithubOauthAuthorization{
      access_token: "123",
      expires_in: 3600,
      refresh_token: "abc",
      refresh_token_expires_in: 3600,
      token_type: "bearer",
      user: build(:user)
    }
  end
end
