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

  def user_github_installation_factory do
    %Astoria.UserGithubInstallations.UserGithubInstallation{
      github_installation: build(:github_installation),
      role_id: 1,
      user: build(:user)
    }
  end

  def github_oauth_authorization_factory do
    %Astoria.GithubOauthAuthorizations.GithubOauthAuthorization{
      expires: true,
      expires_at: 2_000_000_000,
      other: %{},
      refresh_token: "abc",
      scopes: [""],
      token: "123",
      token_type: "Bearer",
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
      expires_at: ~N[3018-11-15 10:00:00],
      github_installation: build(:github_installation),
      rate_limit_remaining: 7000,
      rate_limit_resets_at: ~U[3018-11-15 10:00:00Z],
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
      github_id: github_id(),
      github_repository: build(:github_repository)
    }
  end
end
