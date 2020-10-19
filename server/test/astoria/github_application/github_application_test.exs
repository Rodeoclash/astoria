defmodule Astoria.GithubApplicationTest do
  alias Astoria.{GithubApplication}
  use Astoria.DataCase
  doctest GithubApplication

  test "app_private_key/0" do
    assert {:ok, key} = GithubApplication.app_private_key()
    assert key =~ "BEGIN RSA"
  end

  test "generate_jwt/0" do
    assert GithubApplication.jwt() =~ "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9"
  end
end
