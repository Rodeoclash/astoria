defmodule AstoriaWeb.Schema do
  alias AstoriaWeb.{Schema.Types, Schema.Interfaces, Schema.Resolvers}
  use Absinthe.Schema
  use Absinthe.Relay.Schema, :modern

  import_types(Absinthe.Type.Custom)

  import_types(Interfaces.ActorInterface)
  import_types(Interfaces.NodeInterface)
  import_types(Interfaces.TimestampInterface)

  import_types(Types.ChangeDirectionType)
  import_types(Types.CurrentUserType)
  import_types(Types.GithubInstallationType)
  import_types(Types.GithubRepositoryType)
  import_types(Types.PlotChartType)
  import_types(Types.PlotHeroType)
  import_types(Types.SentimentType)
  import_types(Types.UserType)

  query do
    field :current_user, :current_user do
      resolve(&Resolvers.CurrentUserResolver.get_from_context/3)
    end
  end

  mutation do
  end

  subscription do
    field :github_repository_updated, :github_repository do
      arg(:id, non_null(:id))

      config(fn args, _ ->
        {:ok, topic: args.id}
      end)
    end

    field :github_installation_repositories_updated, :github_installation do
      arg(:id, non_null(:id))

      config(fn args, _ ->
        {:ok, topic: args.id}
      end)
    end
  end
end
