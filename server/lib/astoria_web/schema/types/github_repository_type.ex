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

    field :last_activity_at, :datetime

    field :analysis_monthly_total_change, non_null(:plot_chart) do
      arg(:start, non_null(:datetime))
      arg(:finish, non_null(:datetime))
      resolve(&Resolvers.GithubPullRequestResolver.analysis_monthly_total_change/3)
    end

    field :analysis_last30_total, :plot_hero do
      arg(:start, non_null(:datetime))
      arg(:finish, non_null(:datetime))
      resolve(&Resolvers.GithubPullRequestResolver.analysis_last30_total/3)
    end

    field :analysis_merged_age, :plot_hero do
      arg(:start, non_null(:datetime))
      arg(:finish, non_null(:datetime))
      resolve(&Resolvers.GithubPullRequestResolver.analysis_merged_age/3)
    end

    field :analysis_closed_age, :plot_hero do
      arg(:start, non_null(:datetime))
      arg(:finish, non_null(:datetime))
      resolve(&Resolvers.GithubPullRequestResolver.analysis_closed_age/3)
    end

    field :analysis_opened_age, :plot_hero do
      arg(:start, non_null(:datetime))
      arg(:finish, non_null(:datetime))
      resolve(&Resolvers.GithubPullRequestResolver.analysis_opened_age/3)
    end

    field :analysis_opened_total, :plot_hero do
      arg(:start, non_null(:datetime))
      arg(:finish, non_null(:datetime))
      resolve(&Resolvers.GithubPullRequestResolver.analysis_opened_total/3)
    end
  end

  connection(node_type: :github_repository)
end
