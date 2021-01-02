defmodule Astoria.Users.User do
  alias Astoria.{GithubUsers, UserGithubInstallations}
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :pub_id, :binary_id, read_after_writes: true

    has_many :user_github_installations, UserGithubInstallations.UserGithubInstallation
    has_many :github_installations, through: [:user_github_installations, :github_installation]

    has_one :github_user, GithubUsers.GithubUser

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
  end
end
