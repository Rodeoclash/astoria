defmodule AstoriaWeb.Plugs.SetGraphQLContextPlug do
  @behaviour Plug
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _params) do
    context =
      case get_session(conn, :current_user?) do
        nil -> %{current_user: nil}
        _ -> %{current_user: get_session(conn, :current_user)}
      end

    Absinthe.Plug.put_options(conn, context: context)
  end
end
