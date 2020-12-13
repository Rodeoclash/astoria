defmodule AstoriaWeb.Schema.Types.ChartTraceChangeType do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  object :chart_trace_change do
    field :change, non_null(:float)
    field :datetime, non_null(:string)
    field :total, non_null(:integer)
  end
end
