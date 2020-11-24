defmodule AstoriaWeb.Schema.Types.PlotDateFloatType do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  object :plot_date_float do
    field :traces, non_null(list_of(:chart_trace_date_float))
  end
end
