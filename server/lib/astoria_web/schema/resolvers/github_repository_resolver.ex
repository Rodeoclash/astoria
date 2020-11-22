defmodule AstoriaWeb.Schema.Resolvers.GithubRepositoryResolver do
  alias Astoria.{GithubRepositories.GithubRepository, GithubPullRequests.GithubPullRequest, Repo}
  alias Absinthe.Relay

  def list_from_installation(github_installation, args, _resolution) do
    GithubRepository.filter_by_github_installation_id(github_installation.id)
    |> Relay.Connection.from_query(&Repo.all/1, args)
  end

  def get_from_user(_user, args, _resolution) do
    {:ok, Repo.get_by(GithubRepository, pub_id: args[:id])}
  end

  def name(github_repository, _args, _resolution) do
    {:ok, github_repository.data["name"]}
  end

  def pull_request_count(github_repository, _args, _resolution) do
    result =
      GithubPullRequest.filter_by_github_repository_id(github_repository.id)
      |> GithubPullRequest.count()
      |> Repo.one()

    {:ok, result}
  end
end
