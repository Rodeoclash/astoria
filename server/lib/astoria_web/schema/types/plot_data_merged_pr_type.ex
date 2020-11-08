defmodule AstoriaWeb.Schema.Types.PlotDataMergedPrType do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  object :plot_data_merged_pr do
    field :traces, non_null(list_of(:plot_data_merged_pr_trace))
  end
end
