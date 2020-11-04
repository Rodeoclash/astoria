defmodule AstoriaWeb.Schema.Resolvers.ModelResolver do
  def get_id(parent, _, _) do
    {:ok, parent.pub_id}
  end
end
