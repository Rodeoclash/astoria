defmodule AstoriaWeb.Schema.Types.ChartTraceDateIntegerType do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  object :chart_trace_date_integer do
    field :name, non_null(:string)
    field :x, non_null(list_of(:datetime))
    field :y, non_null(list_of(:integer))
  end
end
