defmodule Astoria.GithubInstallations do
  alias __MODULE__
  alias Astoria.{GithubApplication, Github, Interactions, Repo}

  @doc """
  Trigger a sync of all installations in the system
  """
  @spec sync() :: :ok
  def sync do
    GithubApplication.client()
    |> Github.Api.V3.App.Installations.read()
    |> Interactions.SyncGithubRecords.perform(&GithubInstallations.upsert_from_api/1)
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
  Returns a function that can be used to insert data returned from the Github API
  """
  def upsert_from_api(installation) do
    %GithubInstallations.GithubInstallation{}
    |> GithubInstallations.GithubInstallation.changeset(%{
      data: installation,
      github_id: installation["id"]
    })
    |> Repo.insert(
      on_conflict: {:replace_all_except, [:id, :pub_id]},
      conflict_target: :github_id
    )
  end
end
