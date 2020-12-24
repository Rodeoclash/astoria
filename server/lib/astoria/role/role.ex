defmodule Astoria.Roles.Role do
  alias Astoria.{UserGithubInstallations}
  import Ecto.Changeset
  use Ecto.Schema

  schema "roles" do
    has_many :user_github_installations, UserGithubInstallations.UserGithubInstallation

    field :pub_id, :binary_id, read_after_writes: true
    field :name, :string
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(organisation, attrs) do
    organisation
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
