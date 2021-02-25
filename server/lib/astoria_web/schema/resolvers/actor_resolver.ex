defmodule AstoriaWeb.Schema.Resolvers.ActorResolver do
  alias Astoria.{Users}

  def has_github_installations(user, _args, _resolution) do
    {:ok, Users.has_github_installations?(user)}
  end
end
