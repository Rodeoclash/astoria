defmodule AstoriaWeb.Schema.Types.RepositoryType do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  object :repository do
    interface(:node)
    interface(:timestamp)

    import_fields(:node)
    import_fields(:timestamp)

    field :name, non_null(:string)
  end

  connection(node_type: :repository)
end
