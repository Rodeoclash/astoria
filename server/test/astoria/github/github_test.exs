defmodule Astoria.GithubTest do
  alias Astoria.{Github}
  use ExUnit.Case, async: true
  doctest Github

  test "app_private_key/0" do
    assert {:ok, key} = Github.app_private_key()
    assert key =~ "BEGIN RSA"
  end

  test "generate_jwt/0" do
    assert Github.generate_jwt() =~ "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9"
  end
end
