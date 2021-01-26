defmodule AstoriaWeb.Schema.QueuedPublisher do
  alias __MODULE__
  use GenServer

  @interval 250

  @enforce_keys [
    :args,
    :publish_at
  ]

  defstruct args: [], publish_at: nil

  def start_link(_default) do
    GenServer.start_link(__MODULE__, %{}, name: :schema_queued_publisher)
  end

  @impl true
  def init(state) do
    {:ok, state, {:continue, :start_timer}}
  end

  def enqueue(args, options) do
    GenServer.cast(
      :schema_queued_publisher,
      {:queue_publish, args, options}
    )
  end

  @impl true
  def handle_continue(:start_timer, state) do
    Process.send_after(self(), :tick, @interval)
    {:noreply, state}
  end

  @impl true
  def handle_info(:tick, state) do
    new_state =
      Enum.reduce(state, %{}, fn {id, publisher}, acc ->
        case DateTime.compare(publisher.publish_at, DateTime.utc_now()) do
          n when n in [:lt, :eq] ->
            apply(Absinthe.Subscription, :publish, publisher.args)

            acc

          :gt ->
            Map.put(acc, id, publisher)
        end
      end)

    Process.send_after(self(), :tick, @interval)

    {:noreply, new_state}
  end

  @impl true
  def handle_cast({:queue_publish, args, options}, state) do
    id = Keyword.get(options, :id)
    window = Keyword.get(options, :window, 1)

    publish_at =
      case Map.get(state, id) do
        nil ->
          DateTime.add(DateTime.utc_now(), window)

        existing ->
          existing.publish_at
      end

    new_state =
      Map.merge(state, %{
        id => %QueuedPublisher{
          args: args,
          publish_at: publish_at
        }
      })

    {:noreply, new_state}
  end
end
