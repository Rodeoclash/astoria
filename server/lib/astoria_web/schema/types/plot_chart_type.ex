defmodule AstoriaWeb.Schema.Types.PlotChartType do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  object :plot_chart do
    field :description, non_null(:string)
    field :name, non_null(:string)
    field :traces, :string
  end
end
