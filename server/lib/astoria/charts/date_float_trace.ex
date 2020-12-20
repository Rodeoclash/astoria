defmodule Astoria.Charts.DateFloatTrace do
  import Ecto.Changeset
  use Ecto.Schema

  @derive {Jason.Encoder, only: [:name, :x, :y]}

  schema "chart" do
    field :name, :string
    field :x, {:array, :utc_datetime}
    field :y, {:array, :float}
  end

  @doc false
  def changeset(trace, attrs) do
    trace
    |> cast(attrs, [:name, :x, :y])
    |> validate_required([:name, :x, :y])
  end
end
