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

  test "enqueue/2" do
    github_installation = insert(:github_installation)

    HTTPoisonMock
    |> expect(:post, fn _path, _payload, _headers ->
      {:ok, Fixtures.Github.Api.V3.App.Installations.AccessTokens.create()}
    end)

    payload = %{"hello" => "world"}

    assert {:ok, job} = InstallationAuthorizedRequest.enqueue(github_installation, payload)
    assert job.args == %{encoded: "g3QAAAABbQAAAAVoZWxsb20AAAAFd29ybGQ="}
  end

  describe "perform/1" do
    test "with expired auth" do
      github_installation_authorization =
        insert(:github_installation_authorization, %{
          rate_limit_last_updated_at: DateTime.utc_now(),
          rate_limit_remaining: 500,
          rate_limit_resets_at: ~U[2018-11-15 10:00:00Z]
        })

      github_installation = github_installation_authorization.github_installation

      client = Github.Api.Client.new("1234", "token")
      request = Github.Api.V3.Installation.Repositories.read(client)

      encoded =
        %{
          callback: &callback/2,
          github_installation_id: github_installation.id,
          request: request
        }
        |> Utility.serialise()

      assert {:ok, :rate_expiry_requeue} ==
               InstallationAuthorizedRequest.perform(%Oban.Job{args: %{"encoded" => encoded}})

      assert_enqueued(worker: Astoria.Jobs.GithubSync.InstallationAuthorizedRequest)
    end

    test "with additional results, no existing auth" do
      github_installation = insert(:github_installation)

      client = Github.Api.Client.new("1234", "token")
      request = Github.Api.V3.Installation.Repositories.read(client)

      encoded =
        %{
          callback: &callback/2,
          github_installation_id: github_installation.id,
          request: request
        }
        |> Utility.serialise()

      HTTPoisonMock
      |> expect(:post, fn _path, _payload, _headers ->
        {:ok, Fixtures.Github.Api.V3.App.Installations.AccessTokens.create()}
      end)
      |> expect(:get, fn _path, _headers ->
        {:ok, Fixtures.Github.Api.V3.Installation.Repositories.read()}
      end)

      assert {:ok, :job_performed} ==
               InstallationAuthorizedRequest.perform(%Oban.Job{args: %{"encoded" => encoded}})

      assert_enqueued(worker: Astoria.Jobs.GithubSync.InstallationAuthorizedRequest)
    end
  end
end
