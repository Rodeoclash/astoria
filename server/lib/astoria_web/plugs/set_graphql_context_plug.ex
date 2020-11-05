defmodule AstoriaWeb.Plugs.SetGraphQLContextPlug do
  @behaviour Plug

  def init(opts), do: opts

  def call(
        %{assigns: %{current_user?: current_user?, current_user: current_user}} = conn,
        _params
      ) do
    context =
      case current_user? do
        false -> %{current_user: nil}
        true -> %{current_user: current_user}
      end

    Absinthe.Plug.put_options(conn, context: context)
  end
end
