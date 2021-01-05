defmodule AstoriaWeb.Schema.Types.ChangeDirectionType do
  use Absinthe.Schema.Notation

  enum :change_direction do
    value(:decrease, as: "decrease")
    value(:increase, as: "increase")
  end
end
