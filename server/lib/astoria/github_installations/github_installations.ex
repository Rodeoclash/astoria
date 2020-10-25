defmodule Astoria.GithubInstallations do
  alias Astoria.{GithubApplication, Github, Interactions}

  def sync_installations do
    GithubApplication.client()
    |> Github.Api.V3.App.Installations.read()
    |> Interactions.perform()
  end
end
