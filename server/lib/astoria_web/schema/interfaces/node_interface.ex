defmodule AstoriaWeb.Schema.Interfaces.NodeInterface do
  alias AstoriaWeb.{Schema.Resolvers}
  use Absinthe.Schema.Notation

  interface :node do
    field :id, non_null(:id) do
      resolve(&Resolvers.ModelResolver.get_id/3)
    end

    resolve_type(fn _obj, _ ->
      nil
    end)
  end
end
