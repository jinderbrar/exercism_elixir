defmodule Darts do
  @type position :: {number, number}
  @radius %{
    outer: 10,
    middle: 5,
    inner: 1,
    center: 0
  }

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec distance(position) :: integer
  def distance({x, y}), do: (x**2 + y**2) ** 0.5

  @spec score(position) :: integer
  def score({x, y}) do
    d = distance({x, y})
    cond do
      d > @radius.outer -> 0
      d > @radius.middle -> 1
      d > @radius.inner -> 5
      d >= @radius.center -> 10
    end
  end
end
