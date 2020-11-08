defmodule AstoriaWeb.Schema.Types.PeriodType do
  use Absinthe.Schema.Notation

  enum :period do
    value :day, as: "day"
    value :week, as: "week"
    value :month, as: "month"
    value :year, as: "year"
  end
end
