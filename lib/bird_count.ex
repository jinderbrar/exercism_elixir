defmodule BirdCount do

  def today([]), do: nil
  def today([head | _tail]), do: head

  def increment_day_count([]), do: [1]
  def increment_day_count([h | t]), do: [h+1 | t]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _t]), do: true
  def has_day_without_birds?([_h | t]), do: has_day_without_birds?(t)

  def total([]), do: 0
  def total([h | t]), do: h + total(t)

  def busy_days([]), do: 0
  def busy_days([t | older]), do: (if t >= 5, do: 1, else: 0) + busy_days(older)
end
