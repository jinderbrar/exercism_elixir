defmodule Lasagna do
  def expected_minutes_in_oven, do: 40

  def remaining_minutes_in_oven(time_so_far) do
    expected_minutes_in_oven() - time_so_far
  end

  def preparation_time_in_minutes(no_of_layers) do
    2 * no_of_layers
  end

  def total_time_in_minutes(no_of_layers, time_so_far) do
    preparation_time_in_minutes(no_of_layers) + time_so_far
  end

  def alarm, do: "Ding!"
end
