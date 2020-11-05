defmodule Astoria.GithubOauthAuthorizations do
  alias Astoria.{
    Repo,
    Github,
    GithubApplication,
    GithubOauthAuthorizations.GithubOauthAuthorization
  }

  @doc ~S"""
  Create a Github client from this oauth authorization. It will be refreshed if required.
  """
  @spec client(%GithubOauthAuthorization{}) :: %Github.Api.Client{}
  def client(github_oauth_authorization) do
    case expired?(github_oauth_authorization) do
      true ->
        with {:ok, github_oauth_authorization} <- refresh(github_oauth_authorization),
             do: {:ok, Github.Api.Client.new(github_oauth_authorization.token, "Bearer")}

      false ->
        {:ok, Github.Api.Client.new(github_oauth_authorization.token, "Bearer")}
    end
  end

  @doc ~S"""
  Refresh this oauth authorization
  """
  @spec refresh(%GithubOauthAuthorization{}) :: boolean()
  def refresh(github_oauth_authorization) do
    payload =
      Map.merge(client_secrets(), %{
        grant_type: "refresh_token",
        refresh_token: github_oauth_authorization.refresh_token
      })

    with {:ok, encoded_payload} <- Jason.encode(payload),
         {:ok, data} <- Github.Api.Oauth.create(encoded_payload),
         changeset <-
           Ecto.Changeset.change(github_oauth_authorization, %{
             expires_at:
               DateTime.utc_now()
               |> DateTime.add(String.to_integer(data["expires_in"]))
               |> DateTime.to_unix(),
             refresh_token: data["refresh_token"],
             token: data["access_token"],
             token_type: data["token_type"]
           }),
         do: Repo.update(changeset)
  end

  @doc ~S"""
  Has this token expired? Yes if we're past the expiry date. Expires at is a minute early to ensure we have time for inflight requests.
  """
  @spec expired?(%GithubOauthAuthorization{}) :: boolean()
  def expired?(%GithubOauthAuthorization{expires: nil}), do: false
  def expired?(%GithubOauthAuthorization{expires: false}), do: false
  def expired?(%GithubOauthAuthorization{expires_at: nil}), do: false

  def expired?(%GithubOauthAuthorization{expires_at: expires_at}) do
    with {:ok, expires_at} <- DateTime.from_unix(expires_at),
         expires_at <- DateTime.to_naive(expires_at),
         do:
           NaiveDateTime.compare(
             NaiveDateTime.add(NaiveDateTime.utc_now(), -60),
             expires_at
           ) == :gt
  end

  defp client_secrets do
    %{
      client_id: GithubApplication.client_id(),
      client_secret: GithubApplication.client_secret()
    }
  end
end
