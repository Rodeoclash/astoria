defmodule Astoria.OauthAuthorizations.Github do
  alias Astoria.{Repo, Github, OauthAuthorizations}

  @doc ~S"""
  Exchanges a Github code for access and refresh tokens
  """
  def from_code(client_id, client_secret, code) do
    payload = %{
      client_id: client_id,
      client_secret: client_secret,
      code: code
    }

    with {:ok, encoded_payload} <- Jason.encode(payload),
         response <- Github.Api.Oauth.post(encoded_payload),
         do:
           Repo.insert(%OauthAuthorizations.OauthAuthorization{
             access_token: response["access_token"],
             expires_in: String.to_integer(response["expires_in"]),
             refresh_token: response["refresh_token"],
             refresh_token_expires_in: String.to_integer(response["refresh_token_expires_in"]),
             token_type: response["token_type"]
           })
  end
end
