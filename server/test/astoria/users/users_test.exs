defmodule Astoria.UsersTest do
  alias Astoria.{Users}
  import Astoria.Factory
  use Astoria.DataCase

  doctest Users

  test "get/1" do
    user = insert(:user)
    assert Users.get(user.id).id == user.id
  end
end
