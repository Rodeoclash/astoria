defmodule Astoria.GithubOauthAuthorizations do
  alias Astoria.{
    Repo,
    Github,
    GithubApplication,
    GithubOauthAuthorizations.GithubOauthAuthorization
  }

  # @doc ~S"""
  # Create a github_oauth_authorization from a temporary code
  # """
  # @spec from_temporary_code(String.t()) :: %GithubOauthAuthorization{}
  # def from_temporary_code(code) do
  #  payload = Map.merge(client_secrets(), %{code: code})

  #  with {:ok, encoded_payload} <- Jason.encode(payload),
  #       {:ok, data} <- Github.Api.Oauth.create(encoded_payload),
  #       do:
  #         {:ok,
  #          %GithubOauthAuthorization{
  #            access_token: data["access_token"],
  #            expires_in: String.to_integer(data["expires_in"]),
  #            refresh_token: data["refresh_token"],
  #            refresh_token_expires_in: String.to_integer(data["refresh_token_expires_in"]),
  #            token_type: data["token_type"]
  #          }}
  # end

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
             access_token: data["access_token"],
             expires_in: String.to_integer(data["expires_in"]),
             refresh_token: data["refresh_token"],
             refresh_token_expires_in: String.to_integer(data["refresh_token_expires_in"]),
             token_type: data["token_type"]
           }),
         do: Repo.update(changeset)
  end

  @doc ~S"""
  Has this token expired? Yes if we're past the expiry date. Expires at is a minute early to ensure we have time for inflight requests.

  TODO: Convert this to a virtual generated column when we have support for it
  """
  @spec expired?(%GithubOauthAuthorization{}) :: boolean()
  def expired?(%GithubOauthAuthorization{expires_at: nil}), do: false

  def expired?(%GithubOauthAuthorization{expires_at: expires_at}) do
    NaiveDateTime.compare(
      NaiveDateTime.utc_now(),
      NaiveDateTime.add(expires_at, -60)
    ) == :gt
  end

  # @doc ~S"""
  # Update an existing authorization using data payload
  # """
  # @spec update(%GithubOauthAuthorization{}) :: boolean()
  # def update(github_oauth_authorization, data) do
  #   Ecto.Changeset.change(github_oauth_authorization, %{
  #     access_token: data["access_token"],
  #     expires_in: String.to_integer(data["expires_in"]),
  #     refresh_token: data["refresh_token"],
  #     refresh_token_expires_in: String.to_integer(data["refresh_token_expires_in"]),
  #     token_type: data["token_type"]
  #   })
  #   |> Repo.update()
  # end

  defp client_secrets do
    %{
      client_id: GithubApplication.client_id(),
      client_secret: GithubApplication.client_secret()
    }
  end
end
