defmodule Astoria.Factory do
  use ExMachina.Ecto, repo: Astoria.Repo

  def github_id() do
    sequence(:github_id, & &1)
  end

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

  def github_user_factory do
    %Astoria.GithubUsers.GithubUser{
      data: %{},
      github_id: github_id(),
      user: build(:user)
    }
  end

  def github_installation_factory do
    %Astoria.GithubInstallations.GithubInstallation{
      data: %{},
      github_id: github_id()
    }
  end

  def github_installation_authorization_factory do
    %Astoria.GithubInstallationAuthorizations.GithubInstallationAuthorization{
      data: %{},
      expires_at: NaiveDateTime.add(NaiveDateTime.utc_now(), 3600),
      github_installation: build(:github_installation),
      token: "abc"
    }
  end

  def github_repository_factory do
    %Astoria.GithubRepositories.GithubRepository{
      data: %{},
      github_id: github_id(),
      github_installation: build(:github_installation)
    }
  end

  def github_pull_request_factory do
    %Astoria.GithubPullRequests.GithubPullRequest{
      data: %{},
      github_id: github_id(),
      github_repository: build(:github_repository)
    }
  end
end
