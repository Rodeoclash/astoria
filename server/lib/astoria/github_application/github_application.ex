defmodule Astoria.GithubApplication do
  alias Astoria.{Github}

  @spec client() :: %Github.Api.Client{}
  def client do
    Github.Api.Client.new(jwt(), "Bearer")
  end

  @doc ~S"""
  The app id for this installation

  ## Examples

      iex> Astoria.GithubApplication.app_id()
      "123"
  """
  @spec app_id() :: String.t() | nil
  def app_id() do
    System.get_env("GITHUB_APP_ID")
  end

  @doc ~S"""
  The client id for this installation.

  ## Examples

      iex> Astoria.GithubApplication.client_id()
      "abc"
  """
  @spec client_id() :: String.t() | nil
  def client_id() do
    System.get_env("GITHUB_CLIENT_ID")
  end

  @doc ~S"""
  The client secret for this installation.

  ## Examples

      iex> Astoria.GithubApplication.client_secret()
      "456"
  """
  @spec client_secret() :: String.t() | nil
  def client_secret() do
    System.get_env("GITHUB_CLIENT_SECRET")
  end

  @doc ~S"""
  Reads the app private key
  """
  @spec app_private_key() :: {:ok, String.t()} | {:error, any()}
  def app_private_key() do
    System.get_env("GITHUB_APP_PRIVATE_KEY")
    |> File.read()
  end

  @doc ~S"""
  Generates a signed JWT authenticated as our app suitable for use with the Github API.
  """
  def jwt do
    with iss <- app_id(),
         {:ok, pem} <- app_private_key() do
      extra_claims = %{
        "iss" => iss
      }

      signer = Joken.Signer.create("RS256", %{"pem" => pem})

      Astoria.Github.Token.generate_and_sign!(extra_claims, signer)
    end
  end
end
