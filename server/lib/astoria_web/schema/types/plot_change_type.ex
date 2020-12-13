defmodule AstoriaWeb.Schema.Types.PlotChangeType do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  object :plot_change do
    field :traces, non_null(list_of(:chart_trace_change))
  end
end
