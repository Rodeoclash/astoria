defmodule Astoria.Github.Webhook do
  alias __MODULE__

  @enforce_keys [:payload]
  defstruct payload: %{}

  @doc ~S"""
  Produces a Github Webook struct and captures the payload under `:payload`

  ## Examples

      iex> Astoria.Github.Webhook.new(%{})
      {:ok, %Webhook{payload: %{}}}

  """
  @spec new(map()) :: %Webhook{}
  def new(payload) do
    {:ok, %Webhook{payload: payload}}
  end

  @doc ~S"""
  Extract the username from the Github webhook

  ## Examples

      iex> Astoria.Github.Webhook.username(%Webhook{payload: Astoria.Fixtures.Github.Webhooks.Push.normal()})
      "Rodeoclash"

  """
  @spec username(%Webhook{payload: map()}) :: String.t()
  def username(%Webhook{payload: payload}) do
    payload["repository"]["owner"]["name"]
  end

  @doc ~S"""
  Extract the project/repo name from the Github webhook

  ## Examples

      iex> Astoria.Github.Webhook.projectname(%Webhook{payload: Astoria.Fixtures.Github.Webhooks.Push.normal()})
      "stagehandtest"

  """
  @spec projectname(%Webhook{payload: map()}) :: String.t()
  def projectname(%Webhook{payload: payload}) do
    payload["repository"]["name"]
  end

  @doc ~S"""
  Extract the sha name from the Github webhook

  ## Examples

      iex> Astoria.Github.Webhook.sha(%Webhook{payload: Astoria.Fixtures.Github.Webhooks.Push.normal()})
      "8f7da5b1dcd5402bc67e5f861f110df17253bc08"

  """
  @spec sha(%Webhook{payload: map()}) :: String.t()
  def sha(%Webhook{payload: payload}) do
    payload["head_commit"]["id"]
  end
end
