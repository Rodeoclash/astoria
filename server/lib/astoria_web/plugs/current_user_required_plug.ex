defmodule AstoriaWeb.Plugs.CurrentUserRequiredPlug do
  import Plug.Conn

  def init(opts), do: opts

  def call(%Plug.Conn{assigns: assigns} = conn, _params) do
    case assigns do
      %{current_user: nil} ->
        conn
        |> Phoenix.Controller.redirect(to: "/")
        |> Plug.Conn.halt()

      _ ->
        conn
    end
  end
end
