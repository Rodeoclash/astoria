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
        upsert(github_installation)

      GithubInstallationAuthorizations.expired?(
        github_installation.github_installation_authorization
      ) == true ->
        upsert(github_installation)

      true ->
        {:ok, github_installation.github_installation_authorization}
    end
  end

  def missing?(github_installation) do
    github_installation.github_installation_authorization == nil
  end

  @spec upsert(%GithubInstallations.GithubInstallation{}) ::
          {:ok, %GithubInstallationAuthorizations.GithubInstallationAuthorization{}}
          | {:error, any()}
  def upsert(github_installation) do
    with {:ok, result} <- create_token(github_installation),
         do:
           %GithubInstallationAuthorizations.GithubInstallationAuthorization{}
           |> GithubInstallationAuthorizations.GithubInstallationAuthorization.changeset(%{
             data: result.data.body,
             expires_at: result.data.body["expires_at"],
             github_installation_id: github_installation.id,
             token: result.data.body["token"]
           })
           |> Repo.insert(
             on_conflict: {:replace_all_except, [:id]},
             conflict_target: :github_installation_id
           )
  end

  defp create_token(github_installation) do
    GithubApplication.client()
    |> Github.Api.V3.App.Installations.AccessTokens.create(github_installation.github_id)
    |> Github.Api.V3.Request.perform()
  end
end
