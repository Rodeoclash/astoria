defmodule AstoriaWeb.Schema.Types.PlotHeroType do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  object :plot_hero do
    field :byline, non_null(:string)
    field :change_direction, :change_direction
    field :description, non_null(:string)
    field :name, non_null(:string)
    field :value, non_null(:string)
  end
end
