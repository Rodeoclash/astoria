defmodule AstoriaWeb.InstalledController do
  alias Astoria.{GithubInstallations, Repo}
  use AstoriaWeb, :controller

  action_fallback AstoriaWeb.FallbackController

  @public_name Application.get_env(:astoria, :public_name)

  @doc ~S"""
  Callback after installing the app, redirect to user to OAuth their account
  """
  @spec callback(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def callback(conn, %{
        "installation_id" => installation_id,
        "provider" => _provider,
        "setup_action" => _setup_action
      }) do
    # the installation likely exists at this point in time due to the webhook arriving.
    case %GithubInstallations.GithubInstallation{}
         |> GithubInstallations.GithubInstallation.changeset(%{
           github_id: installation_id
         })
         |> Repo.insert(
           on_conflict: {:replace, [:github_id]},
           conflict_target: :github_id
         ) do
      {:ok, github_installation} ->
        conn
        |> put_flash(:info, "#{@public_name} was installed")
        |> put_session(:github_installation_id, github_installation.id)
        |> redirect(to: Routes.auth_path(conn, :request, :github))
    end
  end
end
