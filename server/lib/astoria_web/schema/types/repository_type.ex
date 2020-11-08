defmodule AstoriaWeb.Schema.Types.RepositoryType do
  alias AstoriaWeb.{Schema.Resolvers}
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  object :repository do
    interface(:node)
    interface(:timestamp)

    import_fields(:node)
    import_fields(:timestamp)

    field :name, non_null(:string) do
      resolve(&Resolvers.GithubRepositoryResolver.name/3)
    end

    field :merged_prs, non_null(:plot_data_merged_pr) do
      arg :period, non_null(:period)
      resolve(&Resolvers.GithubPullRequestResolver.merged_prs/3)
    end
  end

  connection(node_type: :repository)
end
