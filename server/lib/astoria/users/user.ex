defmodule Astoria.Users.User do
  alias Astoria.{GithubAuthorizations}
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :pub_id, :binary_id, read_after_writes: true

    has_one :github_authorization, GithubAuthorizations.GithubAuthorization

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
  end
end
