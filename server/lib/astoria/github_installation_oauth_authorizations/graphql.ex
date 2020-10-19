defmodule Astoria.GithubInstallationOauthAuthorizations.GraphQL do
  alias Astoria.{Github}

  @doc ~S"""
  Makes the supplied query to the GraphQL endpoint in the context of the installed app

  # TODO: We should check and refresh the authorization token if needed here.
  """
  @spec query(String.t()) :: map()
  def query(content) do
    # TODO: Get his
    access_token = 123
    Github.GraphQL.query(access_token, content)
  end
end
