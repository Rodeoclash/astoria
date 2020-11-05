defmodule AstoriaWeb.Schema do
  alias AstoriaWeb.{Schema.Types, Schema.Interfaces, Schema.Resolvers}
  use Absinthe.Schema
  use Absinthe.Relay.Schema, :modern

  import_types(Absinthe.Type.Custom)

  import_types(Interfaces.ActorInterface)
  import_types(Interfaces.NodeInterface)
  import_types(Interfaces.TimestampInterface)

  import_types(Types.CurrentUserType)
  import_types(Types.RepositoryType)

  query do
    field :current_user, :current_user do
      resolve(&Resolvers.CurrentUserResolver.get_from_context/3)
    end
  end

  mutation do
  end
end
