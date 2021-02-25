defmodule AstoriaWeb.Schema.Interfaces.ActorInterface do
  alias AstoriaWeb.{Schema.Resolvers}
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  interface :actor do
    import_fields(:node)
    import_fields(:timestamp)

    resolve_type(fn _obj, _ ->
      nil
    end)

    field :name, non_null(:string)

    field :has_github_installations, non_null(:boolean) do
      resolve(&Resolvers.ActorResolver.has_github_installations/3)
    end

    field :github_repository, non_null(:github_repository) do
      arg(:id, non_null(:id))
      resolve(&Resolvers.GithubRepositoryResolver.get_from_user/3)
    end

    connection field :github_installations, node_type: :github_installation do
      resolve(&Resolvers.GithubInstallationResolver.list_from_user/3)
    end
  end
end
