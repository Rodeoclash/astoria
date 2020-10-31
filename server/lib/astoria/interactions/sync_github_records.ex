defmodule Astoria.Interactions.SyncGithubRecords do
  alias Astoria.{Github}

  def perform(request, upserter) do
    with {:ok, response} <- Github.Api.V3.Request.perform(request),
         do: Enum.each(response.data.body, upserter)

    :ok
  end
end
