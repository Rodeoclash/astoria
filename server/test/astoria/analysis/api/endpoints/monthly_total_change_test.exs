defmodule Astoria.Analysis.Api.Endpoints.MonthlyTotalChangeTest do
  alias Astoria.{Analysis, Analysis.Api.Endpoints.MonthlyTotalChange}
  use Astoria.DataCase

  doctest MonthlyTotalChange

  test "create/1" do
    assert MonthlyTotalChange.create([]) == %Analysis.Api.Request{
             payload: [],
             url: "http://astoria-analysis:8000/monthly_total_change"
           }
  end
end
