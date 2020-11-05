defmodule AstoriaWeb.Schema.Resolvers.CurrentUserResolver do
  def get_from_context(_args, second, %{context: context}) do
    IO.inspect("=== here")
    IO.inspect(context)

    {:ok, nil}
  end
end
