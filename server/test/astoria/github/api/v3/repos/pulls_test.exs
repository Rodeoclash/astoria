defmodule Astoria.Github.Api.V3.Repos.PullsTest do
  alias Astoria.{Github, Github.Api.V3.Repos.Pulls}
  use Astoria.DataCase

  setup do
    client = Github.Api.Client.new("123", "bearer")
    %{client: client}
  end

  describe "read_single/4" do
    test "with options", %{client: client} do
      assert %Github.Api.V3.Request{
               client: client,
               method: :get,
               payload: %{},
               url: "https://api.github.com/repos/full_name/pulls/1?options=options"
             } == Pulls.read_single(client, "full_name", 1, %{options: "options"})
    end

    test "without options", %{client: client} do
      assert %Github.Api.V3.Request{
               client: client,
               method: :get,
               payload: %{},
               url: "https://api.github.com/repos/full_name/pulls/1?"
             } == Pulls.read_single(client, "full_name", 1)
    end
  end

  describe "read_list/4" do
    test "with options", %{client: client} do
      assert %Github.Api.V3.Request{
               client: client,
               method: :get,
               payload: %{},
               url: "https://api.github.com/repos/full_name/pulls?options=options"
             } == Pulls.read_list(client, "full_name", %{options: "options"})
    end

    test "without options", %{client: client} do
      assert %Github.Api.V3.Request{
               client: client,
               method: :get,
               payload: %{},
               url: "https://api.github.com/repos/full_name/pulls?"
             } == Pulls.read_list(client, "full_name")
    end
  end
end
