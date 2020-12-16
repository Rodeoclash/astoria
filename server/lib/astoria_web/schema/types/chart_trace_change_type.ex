defmodule AstoriaWeb.Schema.Types.ChartTraceChangeType do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  object :chart_trace_change do
    field :change, non_null(:float)
    field :current_total, non_null(:integer)
    field :previous_total, non_null(:integer)
  end
end
