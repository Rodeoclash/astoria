defmodule AstoriaWeb.Schema.Types.PlotDateIntegerType do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  object :plot_date_integer do
    field :traces, non_null(list_of(:chart_trace_date_integer))
  end
end
