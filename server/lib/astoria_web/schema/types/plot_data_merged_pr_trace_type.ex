defmodule AstoriaWeb.Schema.Types.PlotDataMergedPrTraceType do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  object :plot_data_merged_pr_trace do
    field :x, non_null(list_of(:naive_datetime))
    field :y, non_null(list_of(:integer))
    field :name, non_null(:string)
  end
end
