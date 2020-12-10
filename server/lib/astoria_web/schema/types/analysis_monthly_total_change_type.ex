defmodule AstoriaWeb.Schema.Types.AnalysisMonthlyTotalChangeType do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  object :analysis_monthly_total_change do
    field :change, non_null(:float)
    field :datetime, non_null(:datetime)
    field :total, non_null(:integer)
  end
end
