defmodule AstoriaWeb.SpaView do
  use AstoriaWeb, :view

  def channel_token(user) do
    salt =
      Application.get_env(:astoria, AstoriaWeb.Endpoint)
      |> Keyword.fetch!(:secret_key_base)

    Phoenix.Token.sign(salt, "channel_token", user.pub_id)
  end

  def user_websocket_url() do
    "wss://" <> AstoriaWeb.Endpoint.host() <> "/socket"
  end

  def public_name() do
    Application.get_env(:astoria, :public_name)
  end
end
