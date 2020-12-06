defmodule Astoria.Jobs.Daily do
  alias Astoria.{GithubInstallations}
  use Oban.Worker, queue: :scheduled

  def perform(_job) do
    GithubInstallations.sync()
    :ok
  end
end
