defmodule AstoriaWeb.Plugs.SetCurrentUser do
  alias Astoria.{Users, Repo}
  import Plug.Conn

  def init(_params) do
  end

  def call(conn, _params) do
    user_id = Plug.Conn.get_session(conn, :user_id)

    cond do
      current_user = user_id && Repo.get(Users.User, user_id) ->
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
