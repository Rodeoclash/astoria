defmodule Astoria.Github.Api.V3.Repos.Pulls do
  alias Astoria.{Github}

  def read(client, full_name) do
    Github.Api.V3.Request.new(client, :get, "repos/#{full_name}/pulls")
  end
end
