defmodule AstoriaWeb.Schema.Resolvers.CurrentUserResolver do
  def get_from_context(_args, _, %{context: %{current_user: current_user}}) do
    {:ok, current_user}
  end
end
