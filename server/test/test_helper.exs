{:ok, _} = Application.ensure_all_started(:ex_machina)
ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Astoria.Repo, :manual)
Mox.defmock(HTTPoisonMock, for: HTTPoison.Base)

System.put_env("GITHUB_APP_ID", "123")
System.put_env("GITHUB_APP_PRIVATE_KEY", "/usr/src/app/test/support/fixtures/github/app_key.pem")
System.put_env("GITHUB_CLIENT_ID", "abc")
System.put_env("GITHUB_CLIENT_SECRET", "456")
