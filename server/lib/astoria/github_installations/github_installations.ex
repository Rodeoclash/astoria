defmodule Astoria.GithubInstallations do
  alias Astoria.{GithubInstallations, GithubApplication, Github, Jobs, Repo, Utility}

  import Ecto.Query, only: [from: 2]

  @doc """
  Trigger a sync of all installations in the system

  # TODO: Convert this to a job
  """
  @spec sync() :: :ok
  def sync do
    GithubApplication.client()
    |> Github.Api.V3.App.Installations.read()
    |> Jobs.SyncGithubInstallations.perform()
  end

  @doc """
  Trigger a sync of a singular github installation. Called after app installation.
  """
  @spec sync(%GithubInstallations.GithubInstallation{}) :: :ok
  def sync(github_installation) do
    request =
      GithubApplication.client()
      |> Github.Api.V3.App.Installations.read(%{
        installation_id: github_installation.github_id
      })

    encoded =
      %{request: request}
      |> Utility.serialise()

    %{encoded: encoded}
    |> Jobs.SyncGithubInstallation.new()
    |> Oban.insert()
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
  Insert data about the installation based on data provided from Github.
  """
  @spec upsert_from_github_data(map()) :: :ok
  def upsert_from_github_data(data) do
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
