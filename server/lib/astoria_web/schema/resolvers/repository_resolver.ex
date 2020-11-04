defmodule AstoriaWeb.Schema.Resolvers.RepositoriesResolver do
  def list_from_user(parent, _) do
    {:ok, parent.pub_id}
  end
end
