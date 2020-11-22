defmodule AstoriaWeb.Schema.Types.GithubRepositoryType do
  alias AstoriaWeb.{Schema.Resolvers}
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  object :github_repository do
    interface(:node)
    interface(:timestamp)

    import_fields(:node)
    import_fields(:timestamp)

    field :name, non_null(:string) do
      resolve(&Resolvers.GithubRepositoryResolver.name/3)
    end

    field :pull_request_count, non_null(:integer) do
      resolve(&Resolvers.GithubRepositoryResolver.pull_request_count/3)
    end

    field :merged_prs_per_person, non_null(:plot_date_integer) do
      arg(:period, non_null(:period))
      arg(:start, non_null(:datetime))
      arg(:finish, non_null(:datetime))
      resolve(&Resolvers.GithubPullRequestResolver.merged_prs_per_person/3)
    end

    field :total_prs_merged, non_null(:plot_date_integer) do
      arg(:period, non_null(:period))
      arg(:start, non_null(:datetime))
      arg(:finish, non_null(:datetime))
      resolve(&Resolvers.GithubPullRequestResolver.total_prs_merged/3)
    end
  end

  connection(node_type: :github_repository)
end
