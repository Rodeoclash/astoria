defmodule AstoriaWeb.Schema do
  alias AstoriaWeb.{Schema.Types, Schema.Interfaces, Schema.Resolvers}
  use Absinthe.Schema
  use Absinthe.Relay.Schema, :modern

  import_types(Absinthe.Type.Custom)

  import_types(Interfaces.ActorInterface)
  import_types(Interfaces.NodeInterface)
  import_types(Interfaces.TimestampInterface)

  import_types(Types.AnalysisMonthlyTotalChangeType)
  import_types(Types.ChartTraceDateFloatType)
  import_types(Types.ChartTraceDateIntegerType)
  import_types(Types.CurrentUserType)
  import_types(Types.GithubInstallationType)
  import_types(Types.GithubRepositoryType)
  import_types(Types.PeriodType)
  import_types(Types.PlotDateFloatType)
  import_types(Types.PlotDateIntegerType)

  query do
    field :current_user, :current_user do
      resolve(&Resolvers.CurrentUserResolver.get_from_context/3)
    end
  end

  mutation do
  end
end
