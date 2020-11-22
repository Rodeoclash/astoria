defmodule Astoria.Charts.DateIntegerTrace do
  import Ecto.Changeset
  use Ecto.Schema

  schema "chart" do
    field :name, :string
    field :x, {:array, :utc_datetime}
    field :y, {:array, :integer}
  end

  @doc false
  def changeset(trace, attrs) do
    trace
    |> cast(attrs, [:name, :x, :y])
    |> validate_required([:name, :x, :y])
  end
end
