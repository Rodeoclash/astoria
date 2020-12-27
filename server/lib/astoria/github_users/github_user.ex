defmodule Astoria.GithubUsers.GithubUser do
  alias Astoria.{Users}
  import Ecto.Changeset
  use Ecto.Schema

  schema "github_users" do
    belongs_to :user, Users.User
    field :data, :map
    field :github_id, :integer
    field :pub_id, :binary_id, read_after_writes: true
    timestamps()
  end

  @doc false
  def changeset(organisation, attrs) do
    organisation
    |> cast(attrs, [:data, :github_id, :user_id])
    |> validate_required([:data, :github_id, :user_id])
  end
end
