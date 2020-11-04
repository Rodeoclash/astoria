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

    connection field :repositories, node_type: :repository do
      resolve(&Resolvers.RepositoriesResolver.list_from_user/2)
    end
  end
end
