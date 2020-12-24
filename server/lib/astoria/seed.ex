defmodule Astoria.Seed do
  alias Astoria.{Roles, Repo}

  def perform do
    %Roles.Role{}
    |> Roles.Role.changeset(%{
      id: 1,
      name: "Administrator",
      description:
        "Able to manage all aspects of the installation, including promoting other users to user management."
    })
    |> Repo.insert(
      on_conflict: {:replace_all_except, [:id, :pub_id]},
      conflict_target: :id
    )

    %Roles.Role{}
    |> Roles.Role.changeset(%{
      id: 1,
      name: "User",
      description:
        "Able to view installations they are attached to but not add other users to those installations."
    })
    |> Repo.insert(
      on_conflict: {:replace_all_except, [:id, :pub_id]},
      conflict_target: :id
    )
  end
end
