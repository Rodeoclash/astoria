defmodule Astoria.Jobs.GithubSync.InstallationAuthorizedRequestTest do
  alias Astoria.{Jobs.GithubSync.InstallationAuthorizedRequest, Repo, Github, Utility, Fixtures}
  import Astoria.Factory
  import Mox
  use Astoria.DataCase
  use Oban.Testing, repo: Astoria.Repo

  doctest InstallationAuthorizedRequest

  setup :verify_on_exit!

  def callback(_params, _response) do
  end

  describe "perform/1" do
    test "with complete run" do
      github_installation_authorization =
        insert(:github_installation_authorization, %{
          rate_limit_remaining: 7000,
          rate_limit_resets_at: ~U[2020-10-27 12:21:41Z]
        })

      client = Github.Api.Client.new("1234", "token")
      request = Github.Api.V3.Installation.Repositories.read(client)

      encoded =
        %{
          callback: &callback/2,
          github_installation_authorization_id: github_installation_authorization.id,
          job: Astoria.Jobs.GithubSync.InstallationAuthorizedRequest,
          request: request
        }
        |> Utility.serialise()

      HTTPoisonMock
      |> expect(:get, fn _path, _headers ->
        {:ok, Fixtures.Github.Api.V3.Installation.Repositories.read()}
      end)

      assert {:ok, :job_performed} ==
               InstallationAuthorizedRequest.perform(%Oban.Job{args: %{"encoded" => encoded}})

      assert_enqueued(worker: Astoria.Jobs.GithubSync.InstallationAuthorizedRequest)
    end
  end
end
