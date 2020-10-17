defmodule Astoria.Github.Oauth do
  alias Astoria.{Github, GithubAuthorizations}

  @http_client Application.get_env(:astoria, :http_client)

  @doc ~S"""
  GitHub OAuth token exchange endpoint
  """
  @spec endpoint() :: String.t()
  def endpoint do
    "https://#{Github.domain()}/login/oauth/access_token"
  end

  @doc ~S"""
  Required headers for OAuth query
  """
  @spec headers() :: ["Content-Type": String.t()]
  def headers() do
    [{"Content-Type", "application/json"}]
  end

  @doc ~S"""
  Exchanges a Github code for access and refresh tokens
  """
  @spec tokens_from_code(String.t(), String.t(), String.t()) ::
          {:ok, HTTPoison.Response.t()} | {:error, HTTPoison.Error.t()}
  def tokens_from_code(client_id, client_secret, code) do
    payload = %{
      client_id: client_id,
      client_secret: client_secret,
      code: code
    }

    with {:ok, encoded_payload} <- Jason.encode(payload),
         {:ok, %HTTPoison.Response{body: body}} <-
           @http_client.post(
             endpoint(),
             encoded_payload,
             headers()
           ),
         decoded_query <- URI.decode_query(body),
         changeset <-
           GithubAuthorizations.GithubAuthorization.changeset(
             %GithubAuthorizations.GithubAuthorization{user_id: -1},
             decoded_query
           ),
         {:ok, authorization} <- Ecto.Changeset.apply_action(changeset, :update),
         do: {:ok, authorization}
  end
end
