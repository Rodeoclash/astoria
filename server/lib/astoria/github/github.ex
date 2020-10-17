defmodule Astoria.Github do
  @doc ~S"""
  GitHub domain name
  """
  @spec domain() :: String.t()
  def domain do
    "github.com"
  end

  @doc ~S"""
  The app id for this installation

  ## Examples

      iex> Astoria.Github.app_id()
      "123"
  """
  @spec app_id() :: String.t() | nil
  def app_id() do
    System.get_env("GITHUB_APP_ID")
  end

  @doc ~S"""
  The client id for this installation.

  ## Examples

      iex> Astoria.Github.client_id()
      "abc"
  """
  @spec client_id() :: String.t() | nil
  def client_id() do
    System.get_env("GITHUB_CLIENT_ID")
  end

  @doc ~S"""
  The client secret for this installation.

  ## Examples

      iex> Astoria.Github.client_secret()
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
  def generate_jwt do
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
