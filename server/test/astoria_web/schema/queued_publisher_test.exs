defmodule AstoriaWeb.Schema.QueuedPublisherTest do
  alias AstoriaWeb.Schema.QueuedPublisher
  use Astoria.DataCase

  doctest QueuedPublisher

  describe "handle_cast/2" do
    test "when no value exists" do
      pubsub = :pubsub
      mutation_result = :mutation_result
      info = :info

      args = {
        :queue_publish,
        pubsub,
        mutation_result,
        info,
        [id: 1, window: 2]
      }

      state = %{}

      assert {:noreply, %{1 => %{payload: payload, publish_at: publish_at}}} =
               QueuedPublisher.handle_cast(args, state)

      assert payload == [
        info: info,
        mutation_result: mutation_result,
        pubsub: pubsub
      ]

      assert DateTime.compare(publish_at, DateTime.utc_now()) == :gt
    end
  end
end
