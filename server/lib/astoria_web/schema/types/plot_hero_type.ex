defmodule AstoriaWeb.Schema.Types.PlotHeroType do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  object :plot_hero do
    field :change, :float
    field :change_direction, :change_direction
    field :current_total, :string
    field :description, non_null(:string)
    field :name, non_null(:string)
    field :previous_total, :string
  end
end
