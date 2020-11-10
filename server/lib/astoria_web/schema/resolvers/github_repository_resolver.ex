defmodule AstoriaWeb.Schema.Resolvers.GithubRepositoryResolver do
  alias Astoria.{GithubRepositories.GithubRepository, Repo}
  alias Absinthe.Relay

  def list_from_user(user, args, _resolution) do
    GithubRepository.for_user(user.id)
    |> Relay.Connection.from_query(&Repo.all/1, args)
  end

  def get(user, args, _resolution) do
    result =
      GithubRepository.for_user(user.id)
      |> GithubRepository.filter_by_pub_id(args[:id])
      |> Repo.one()

    {:ok, result}
  end

  def name(repository, _args, _resolution) do
    {:ok, repository.data["name"]}
  end
end
