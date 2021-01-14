defmodule Astoria.GithubRepositories.UpdateRegister do
  use GenServer

  @interval 3000

  def start_link(_default) do
    GenServer.start_link(__MODULE__, %{}, name: :github_repository_update_register)
  end

  def init(state) do
    {:ok, state, {:continue, :start_timer}}
  end

  def handle_continue(:start_timer, state) do
    Process.send_after(self(), :tick, @interval)
    {:noreply, state}
  end

  def handle_info(:tick, state) do
    time =
      DateTime.utc_now()
      |> DateTime.to_time()
      |> Time.to_iso8601()

    IO.puts("The time is now: #{time}")

    Process.send_after(self(), :tick, @interval)

    Enum.each state, fn {_id, args} ->
      Absinthe.Subscription.publish()
    end

    {:noreply, %{}}
  end
end

# %{"github_repository_id" => [...args]}
