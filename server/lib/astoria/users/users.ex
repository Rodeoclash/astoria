defmodule Astoria.Users do
  alias Astoria.{Users.User, Repo}

  @doc ~S"""
  Gets a single user by id
  """
  @spec get(term()) :: %User{}
  def get(id) do
    Repo.get(User, id)
  end
end
