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

    connection field :repositories, node_type: :repository do
      resolve(&Resolvers.GithubRepositoryResolver.list_from_user/3)
    end

    field :repository, non_null(:repository) do
      arg(:id, non_null(:id))
      resolve(&Resolvers.GithubRepositoryResolver.get/3)
    end
  end
end
