defmodule Astoria.Users.GithubOauthAuthorizations do
  alias Astoria.{GithubOauthAuthorizations, Users, Repo}

  @doc ~S"""
  Update / insert the authorization using a Ueberauth credentials
  """
  @spec upsert(%Users.User{}, %Ueberauth.Auth.Credentials{}) ::
          %GithubOauthAuthorizations.GithubOauthAuthorization{}
  def upsert(user, credentials) do
    %GithubOauthAuthorizations.GithubOauthAuthorization{}
    |> GithubOauthAuthorizations.GithubOauthAuthorization.changeset(%{
      expires: credentials.expires,
      expires_at: credentials.expires_at,
      other: credentials.other,
      refresh_token: credentials.refresh_token,
      scopes: credentials.scopes,
      secret: credentials.secret,
      token: credentials.token,
      token_type: credentials.token_type,
      user_id: user.id
    })
    |> Repo.insert(
      on_conflict: {:replace_all_except, [:id, :user_id]},
      conflict_target: :user_id
    )
  end
end
