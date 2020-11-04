defmodule AstoriaWeb.Schema.Interfaces.TimestampInterface do
  use Absinthe.Schema.Notation

  interface :timestamp do
    field :inserted_at, non_null(:naive_datetime)
    field :updated_at, non_null(:naive_datetime)

    resolve_type(fn _obj, _ ->
      nil
    end)
  end
end
