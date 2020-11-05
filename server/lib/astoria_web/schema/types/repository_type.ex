defmodule AstoriaWeb.Schema.Types.RepositoryType do
  alias AstoriaWeb.{Schema.Resolvers}
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  object :repository do
    interface(:node)
    interface(:timestamp)

    import_fields(:node)
    import_fields(:timestamp)

    field :name, non_null(:string) do
      resolve(&Resolvers.RepositoriesResolver.name/3)
    end
  end

  connection(node_type: :repository)
end
