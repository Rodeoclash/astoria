defmodule AstoriaWeb.UserSocket do
  alias Astoria.{Repo, Users}
  use Phoenix.Socket
  use Absinthe.Phoenix.Socket, schema: AstoriaWeb.Schema

  ## Channels
  # channel "room:*", AstoriaWeb.RoomChannel

  # Socket params are passed from the client and can
  # be used to verify and authenticate a user. After
  # verification, you can put default assigns into
  # the socket that will be set for all channels, ie
  #
  #     {:ok, assign(socket, :user_id, verified_user_id)}
  #
  # To deny connection, return `:error`.
  #
  # See `Phoenix.Token` documentation for examples in
  # performing token verification on connect.
  @impl true
  def connect(params, socket, _connect_info) do
    current_user = current_user(params)

    socket =
      Absinthe.Phoenix.Socket.put_options(socket,
        context: %{
          current_user: current_user
        }
      )

    Task.async(Users, :indicate_github_installation_repositories_updated, [
      current_user,
      delayed: true
    ])

    {:ok, socket}
  end

  defp current_user(%{"channelToken" => channel_token}) do
    salt =
      Application.get_env(:astoria, AstoriaWeb.Endpoint)
      |> Keyword.fetch!(:secret_key_base)

    case Phoenix.Token.verify(salt, "channel_token", channel_token, max_age: 86_400) do
      {:ok, user_pub_id} ->
        Repo.get_by(Users.User, pub_id: user_pub_id)
    end
  end

  # Socket id's are topics that allow you to identify all sockets for a given user:
  #
  #     def id(socket), do: "user_socket:#{socket.assigns.user_id}"
  #
  # Would allow you to broadcast a "disconnect" event and terminate
  # all active sockets and channels for a given user:
  #
  #     AstoriaWeb.Endpoint.broadcast("user_socket:#{user.id}", "disconnect", %{})
  #
  # Returning `nil` makes this socket anonymous.
  @impl true
  def id(_socket), do: nil
end
