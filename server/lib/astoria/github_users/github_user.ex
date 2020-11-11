defmodule Astoria.GithubUsers.GithubUser do
  alias Astoria.{Users, GithubInstallations}
  use Ecto.Schema
  import Ecto.Changeset

  schema "github_users" do
    belongs_to :user, Users.User
    field :data, :map
    field :github_id, :integer
    field :pub_id, :binary_id, read_after_writes: true

    has_one :github_installation,
            GithubInstallations.GithubInstallation

    timestamps()
  end

  @doc false
  def changeset(organisation, attrs) do
    organisation
    |> cast(attrs, [:data, :github_id, :user_id])
    |> validate_required([:data, :github_id, :user_id])
  end
end
