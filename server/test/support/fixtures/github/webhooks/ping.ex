defmodule Astoria.Fixtures.Github.Webhooks.Ping do
  def app_created do
    %{
      "hook" => %{
        "active" => true,
        "app_id" => 68146,
        "config" => %{
          "content_type" => "json",
          "insecure_ssl" => "0",
          "url" => "https://gotchaslocal.au.ngrok.io/api/github/webhook"
        },
        "created_at" => "2020-06-09T10:50:02Z",
        "events" => ["push"],
        "id" => 220_323_246,
        "name" => "web",
        "type" => "App",
        "updated_at" => "2020-06-09T10:50:02Z"
      },
      "hook_id" => 220_323_246,
      "zen" => "Favor focus over features."
    }
  end
end
