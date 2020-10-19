defmodule Astoria.UserGithubOauthAuthorizations.GraphQL do
  alias Astoria.{Github, UserGithubOauthAuthorizations}

  @doc ~S"""
  Makes the supplied query to the GraphQL endpoint in the context of the given user github auth

  # TODO: We should check and refresh the authorization token if needed here.
  """
  @spec query(%UserGithubOauthAuthorizations.UserGithubOauthAuthorization{}, String.t()) :: map()
  def query(authorization, content) do
    Github.GraphQL.query(authorization.access_token, content)
  end
end
