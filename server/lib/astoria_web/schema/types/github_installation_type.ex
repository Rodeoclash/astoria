defmodule AstoriaWeb.Schema.Types.GithubInstallationType do
  alias AstoriaWeb.{Schema.Resolvers}
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  object :github_installation do
    interface(:node)
    interface(:timestamp)

    import_fields(:node)
    import_fields(:timestamp)

    field :name, non_null(:string) do
      resolve(&Resolvers.GithubInstallationResolver.name/3)
    end

    connection field :github_repositories, node_type: :github_repository do
      resolve(&Resolvers.GithubRepositoryResolver.list_from_installation/3)
    end
  end

  connection(node_type: :github_installation)
end
