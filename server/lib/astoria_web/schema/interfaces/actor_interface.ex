defmodule AstoriaWeb.Schema.Interfaces.ActorInterface do
  alias AstoriaWeb.{Schema.Resolvers}
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  interface :actor do
    import_fields(:node)
    import_fields(:timestamp)

    resolve_type(fn _obj, _ ->
      nil
    end)

    field :name, non_null(:string)

    connection field :github_installations, node_type: :github_installation do
      resolve(&Resolvers.GithubInstallationResolver.list_from_user/3)
    end
  end
end
