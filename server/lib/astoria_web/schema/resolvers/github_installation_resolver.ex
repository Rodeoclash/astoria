defmodule AstoriaWeb.Schema.Resolvers.GithubInstallationResolver do
  alias Astoria.{GithubInstallations.GithubInstallation, Repo}
  alias Absinthe.Relay

  def list_from_user(user, args, _resolution) do
    GithubInstallation.for_user(user.id)
    |> Relay.Connection.from_query(&Repo.all/1, args)
  end

  def name(github_installation, _args, _resolution) do
    {:ok, github_installation.data["account"]["login"]}
  end
end
