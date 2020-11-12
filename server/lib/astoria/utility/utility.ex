defmodule Astoria.Utility do
  def serialise(data) do
    data
    |> :erlang.term_to_binary()
    |> Base.encode64()
  end

  def deserialise(data) do
    data
    |> Base.decode64!()
    |> :erlang.binary_to_term()
  end
end
