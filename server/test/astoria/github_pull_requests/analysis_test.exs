defmodule Astoria.GithubPullRequests.AnalysisTest do
  alias Astoria.{GithubPullRequests.Analysis}
  import Mox
  use Astoria.DataCase

  doctest Analysis

  setup :verify_on_exit!

  test "monthly_total_change/1" do
    HTTPoisonMock
    |> expect(:post, fn url, payload, _headers ->
      assert url == "http://astoria-analysis:8000/monthly_total_change"
      assert payload == ~s([{"merged_at":"2014-10-02T00:29:10Z"}])

      {:ok,
       %HTTPoison.Response{
         body: ~s([{"change":0.5, "datetime":"2020-12-15T10:49:31+0000", "total":5}])
       }}
    end)

    assert Analysis.monthly_total_change([
             %{merged_at: ~U[2014-10-02 00:29:10Z]}
           ])
  end
end
