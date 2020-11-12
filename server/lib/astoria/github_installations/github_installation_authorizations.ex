defmodule Astoria.GithubInstallations.GithubInstallationAuthorizations do
  alias Astoria.{GithubInstallationAuthorizations, Github, GithubInstallations}

  alias Astoria.{
    GithubApplication,
    GithubInstallationAuthorizations,
    Repo
  }

  def get(github_installation) do
    github_installation = Repo.preload(github_installation, :github_installation_authorization)

    cond do
      missing?(github_installation) == true ->
        with {:ok, response} <- create(github_installation),
             do: upsert(github_installation, response.poison_response.body)

      GithubInstallationAuthorizations.expired?(
        github_installation.github_installation_authorization
      ) == true ->
        with {:ok, response} <- create(github_installation),
             do: upsert(github_installation, response.poison_response.body)

      true ->
        {:ok, github_installation.github_installation_authorization}
    end
  end

  def missing?(github_installation) do
    github_installation.github_installation_authorization == nil
  end

  def create(github_installation) do
    GithubApplication.client()
    |> Github.Api.V3.App.Installations.AccessTokens.create(github_installation.github_id)
    |> Github.Api.V3.Request.perform()
  end

  @spec upsert(%GithubInstallations.GithubInstallation{}, map()) ::
          {:ok, %GithubInstallationAuthorizations.GithubInstallationAuthorization{}}
          | {:error, any()}
  def upsert(github_installation, data) do
    %GithubInstallationAuthorizations.GithubInstallationAuthorization{}
    |> GithubInstallationAuthorizations.GithubInstallationAuthorization.changeset(%{
      data: data,
      expires_at: data["expires_at"],
      github_installation_id: github_installation.id,
      token: data["token"]
    })
    |> Repo.insert(
      on_conflict: {:replace_all_except, [:id]},
      conflict_target: :github_installation_id
    )
  end
end
