defmodule Astoria.Github.Token do
  use Joken.Config

  @impl true
  def token_config do
    default_claims(default_exp: 10 * 60)
  end
end
