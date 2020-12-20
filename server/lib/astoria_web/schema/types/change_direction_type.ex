defmodule AstoriaWeb.Schema.Types.ChangeDirectionType do
  use Absinthe.Schema.Notation

  enum :change_direction do
    value(:negative, as: "negative")
    value(:positive, as: "positive")
  end
end
