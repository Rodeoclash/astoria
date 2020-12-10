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

    field :merged_prs_per_person, non_null(:plot_date_integer) do
      arg(:period, non_null(:period))
      arg(:start, non_null(:datetime))
      arg(:finish, non_null(:datetime))
      resolve(&Resolvers.GithubPullRequestResolver.merged_prs_per_person/3)
    end

    field :merged_prs, non_null(:plot_date_integer) do
      arg(:period, non_null(:period))
      arg(:start, non_null(:datetime))
      arg(:finish, non_null(:datetime))
      resolve(&Resolvers.GithubPullRequestResolver.merged_prs/3)
    end

    field :average_days_pr_open_before_merge, non_null(:plot_date_float) do
      arg(:period, non_null(:period))
      arg(:start, non_null(:datetime))
      arg(:finish, non_null(:datetime))
      resolve(&Resolvers.GithubPullRequestResolver.average_days_pr_open_before_merge/3)
    end

    field :average_change_in_pr, non_null(:plot_date_float) do
      arg(:period, non_null(:period))
      arg(:start, non_null(:datetime))
      arg(:finish, non_null(:datetime))
      resolve(&Resolvers.GithubPullRequestResolver.average_change_in_pr/3)
    end

    field :analysis_monthly_total_change, non_null(list_of(:analysis_monthly_total_change)) do
      arg(:period, non_null(:period))
      arg(:start, non_null(:datetime))
      arg(:finish, non_null(:datetime))
      resolve(&Resolvers.GithubPullRequestResolver.average_change_in_pr/3)
    end
  end

  connection(node_type: :github_repository)
end
