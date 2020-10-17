defmodule Astoria.Factory do
  use ExMachina.Ecto, repo: Astoria.Repo

  def github_organisation_factory do
    %Astoria.Organisations.GithubOrganisation{
    }
  end

  def github_pull_request_factory do
    %Astoria.GithubPullRequests.GithubPullRequest{
    }
  end

  def user_factory do
    %Astoria.Users.User{
      email: sequence(:email, &"email-#{&1}@example.com"),
      name: "Hicks",
    }
  end
end
