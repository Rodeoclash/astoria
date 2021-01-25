defmodule AstoriaWeb.Schema.QueuedPublisher do
  use GenServer

  @interval 250

  def start_link(_default) do
    GenServer.start_link(__MODULE__, %{}, name: :github_repository_update_register)
  end

  @impl true
  def init(state) do
    {:ok, state, {:continue, :start_timer}}
  end

  @impl true
  def handle_continue(:start_timer, state) do
    Process.send_after(self(), :tick, @interval)
    {:noreply, state}
  end

  @impl true
  def handle_info(:tick, state) do
    # loop through all, check if current time > queued time, execute and clear

    Process.send_after(self(), :tick, @interval)

    {:noreply, state}
  end

  @impl true
  def handle_cast({:queue_publish, pubsub, mutation_result, info, options}, state) do
    id = Keyword.get(options, :id)
    window = Keyword.get(options, :window, 1)

    new_state =
      case Map.get(state, id) do
        nil ->
          Map.merge(state, %{
            id => %{
              payload: [
                info: info,
                mutation_result: mutation_result,
                pubsub: pubsub
              ],
              publish_at: DateTime.add(DateTime.utc_now(), window)
            }
          })

        existing ->
          %{
            state
            | id => [
                payload: [
                  info: info,
                  mutation_result: mutation_result,
                  pubsub: pubsub
                ],
                publish_at: existing[:publish_at]
              ]
          }
      end

    {:noreply, new_state}
  end
end
