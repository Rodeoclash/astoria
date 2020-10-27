defmodule Astoria.GithubInstallations do
  alias __MODULE__
  alias Astoria.{GithubApplication, Github, Interactions}

  @doc """
  Trigger a sync of all installations in the system
  """
  @spec sync() :: :ok
  def sync do
    GithubApplication.client()
    |> Github.Api.V3.App.Installations.read()
    |> Interactions.SyncGithubInstallations.perform()
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
end
