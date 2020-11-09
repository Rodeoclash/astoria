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

    field :merged_prs_per_person, non_null(:plot_data_merged_pr) do
      arg :period, non_null(:period)
      resolve(&Resolvers.GithubPullRequestResolver.merged_prs_per_person/3)
    end

    field :total_prs_merged, non_null(:plot_data_merged_pr) do
      arg :period, non_null(:period)
      resolve(&Resolvers.GithubPullRequestResolver.total_prs_merged/3)
    end
  end

  connection(node_type: :repository)
end
