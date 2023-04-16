defmodule KitchenCalculator do

  def take(vp = {:cup, _}), do: 240
  def take(vp = {:milliliter, _}), do: 1
  def take(vp = {:fluid_ounce, _}), do: 30
  def take(vp = {:teaspoon, _}), do: 5
  def take(vp = {:tablespoon, _}), do: 15

  def get_volume({_, v}), do: v

  def to_milliliter({u, x}), do: {:milliliter, x * take({u, :nil})}

  def from_milliliter({_, v}, unit) do
    {unit, v / take({unit, :nil})}
  end

  def convert(f, unit) do
    {_, q} = to_milliliter(f)
    {unit, q / take({unit, :nil})}
  end
end
