defmodule AstoriaWeb.Schema.QueuedPublisherTest do
  alias AstoriaWeb.Schema.QueuedPublisher
  import Astoria.Factory
  use Astoria.DataCase

  doctest QueuedPublisher

  describe "handle_info/2" do
    test "when none lodged for publishing" do
      state = %{}

      assert {:noreply, state} == QueuedPublisher.handle_info(:tick, state)
    end

    test "when lodged but before time" do
      github_repository = insert(:github_repository)

      args = [
        AstoriaWeb.Endpoint,
        github_repository,
        [github_repository_updated: "#{github_repository.pub_id}"]
      ]

      publish_at = ~U[3018-11-15 10:00:00Z]

      state = %{
        1 => %QueuedPublisher{args: args, publish_at: publish_at}
      }

      assert {:noreply, state} == QueuedPublisher.handle_info(:tick, state)
    end

    test "when lodged and due" do
      github_repository = insert(:github_repository)

      args = [
        AstoriaWeb.Endpoint,
        github_repository,
        [github_repository_updated: "#{github_repository.pub_id}"]
      ]

      publish_at = ~U[2018-11-15 10:00:00Z]

      state = %{
        1 => %QueuedPublisher{args: args, publish_at: publish_at}
      }

      assert {:noreply, %{}} == QueuedPublisher.handle_info(:tick, state)
    end
  end

  describe "handle_cast/2" do
    test "when none lodged for publishing" do
      github_repository = insert(:github_repository)

      publish_args = [
        AstoriaWeb.Endpoint,
        github_repository,
        [github_repository_updated: "#{github_repository.pub_id}"]
      ]

      data = {
        :queue_publish,
        publish_args,
        [id: 1, window: 2]
      }

      state = %{}

      assert {:noreply, %{1 => %QueuedPublisher{args: args, publish_at: publish_at}}} =
               QueuedPublisher.handle_cast(data, state)

      assert args == publish_args

      assert DateTime.compare(publish_at, DateTime.utc_now()) == :gt
    end

    test "with existing lodged" do
      github_repository = insert(:github_repository)

      publish_args = [
        AstoriaWeb.Endpoint,
        github_repository,
        [github_repository_updated: "#{github_repository.pub_id}"]
      ]

      publish_at = ~U[2018-11-15 10:00:00Z]

      data = {
        :queue_publish,
        publish_args,
        [id: 1, window: 2]
      }

      state = %{
        1 => %QueuedPublisher{
          args: publish_args,
          publish_at: publish_at
        }
      }

      assert {:noreply, %{1 => %QueuedPublisher{args: args, publish_at: existing_publish_at}}} =
               QueuedPublisher.handle_cast(data, state)

      assert args == publish_args

      assert existing_publish_at == publish_at
    end
  end
end
