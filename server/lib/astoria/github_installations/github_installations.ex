defmodule Astoria.GithubInstallations do
  alias Astoria.{GithubInstallations, GithubApplication, Github, Jobs, Repo}

  import Ecto.Query, only: [from: 2]

  @doc """
  Trigger a sync of all installations in the system
  """
  @spec sync() :: :ok
  def sync do
    GithubApplication.client()
    |> Github.Api.V3.App.Installations.read()
    |> Jobs.SyncGithubInstallations.perform()
  end

  @doc """
  How many installations have been created
  """
  @spec count() :: :ok
  def count do
    from(github_installation in GithubInstallations.GithubInstallation,
      select: count(github_installation.id)
    )
    |> Repo.one()
  end

  @doc """
  Produce a client struct suitable for accessing repos as the app
  """
  @spec client(%GithubInstallations.GithubInstallation{}) ::
          {:ok, %Github.Api.Client{}} | {:error, any()}
  def client(github_installation) do
    with {:ok, github_installation_authorization} <-
           GithubInstallations.GithubInstallationAuthorizations.get(github_installation),
         do: {:ok, Github.Api.Client.new(github_installation_authorization.token, "token")}
  end

  @doc """
  Insert data about the installation. Will update if matches github_id
  """
  @spec upsert(map()) :: :ok
  def upsert(data) do
    %GithubInstallations.GithubInstallation{}
    |> GithubInstallations.GithubInstallation.changeset(%{
      data: data,
      github_id: data["id"]
    })
    |> Repo.insert(
      on_conflict: {:replace_all_except, [:id, :pub_id, :github_user_id]},
      conflict_target: :github_id
    )
  end
end
