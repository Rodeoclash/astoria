defmodule Astoria.GithubInstallations do
  alias Astoria.{Repo}
  alias __MODULE__

  @model GithubInstallations.GithubInstallation
  @struct %GithubInstallations.GithubInstallation{}

  def create(attrs) do
    @struct
    |> @model.changeset(attrs)
    |> Repo.insert()
  end
end
