defmodule AstoriaWeb.Plugs.SetSessionCurrentUserPlug do
  alias Astoria.{Users, Repo}
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _params) do
    IO.inspect("=== found set user")
    conn = fetch_session(conn)

    current_user_id = get_session(conn, :current_user_id)

    cond do
      current_user = current_user_id != nil && Repo.get(Users.User, current_user_id) ->
        conn
        |> assign(:current_user, current_user)
        |> assign(:current_user?, true)

      true ->
        conn
        |> assign(:current_user, nil)
        |> assign(:current_user?, false)
    end
  end
end
