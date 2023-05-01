defmodule LucasNumbers do
  @moduledoc """
  Lucas numbers are an infinite sequence of numbers which build progressively
  which hold a strong correlation to the golden ratio (φ or ϕ)

  E.g.: 2, 1, 3, 4, 7, 11, 18, 29, ...
  """
  @error_msg "count must be specified as an integer >= 1"

  def generate(count) when not is_integer(count) or count < 1, do: raise ArgumentError, @error_msg

  def generate(count) when count == 1, do: [2]

  def generate(count) when count == 2, do: [2, 1]

  def generate(count) do
      Stream.iterate([2, 1], fn [x, y] -> [y, x+y] end)
      |> Stream.map(&hd/1)
      |> Enum.take(count)
  end
end
