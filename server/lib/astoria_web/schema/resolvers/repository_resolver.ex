defmodule AstoriaWeb.Schema.Resolvers.RepositoriesResolver do
  alias Astoria.{GithubRepositories, Repo}
  alias Absinthe.Relay

  def list_from_user(user, args, _resolution) do
    GithubRepositories.GithubRepository.for_users([user.id])
    |> Relay.Connection.from_query(&Repo.all/1, args)
  end

  def name(repository, _args, _resolution) do
    {:ok, repository.data["name"]}
  end
end
