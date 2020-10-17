defmodule Astoria.GithubAuthorizations.GraphQL do
  alias Astoria.{Github, GithubAuthorizations}

  @doc ~S"""
  Makes the supplied query to the GraphQL endpoint

  # TODO: We should check and refresh the authorization token if needed here.
  """
  @spec query(%GithubAuthorizations.GithubAuthorization{}, String.t()) :: map()
  def query(authorization, content) do
    Github.GraphQL.query(authorization.access_token, content)
  end
end
