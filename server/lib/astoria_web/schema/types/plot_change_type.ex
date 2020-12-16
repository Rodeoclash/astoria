defmodule AstoriaWeb.Schema.Types.PlotChangeType do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  object :plot_change do
    field :trace, non_null(:chart_trace_change)
  end
end
