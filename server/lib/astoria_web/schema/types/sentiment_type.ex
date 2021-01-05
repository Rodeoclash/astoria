defmodule AstoriaWeb.Schema.Types.SentimentType do
  use Absinthe.Schema.Notation

  enum :sentiment do
    value(:negative, as: "negative")
    value(:positive, as: "positive")
  end
end
