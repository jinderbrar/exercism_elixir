defmodule LibraryFees do

  @spec datetime_from_string(String.t()) :: NaiveDateTime.t()
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  @spec before_noon?(NaiveDateTime.t()) :: boolean()
  def before_noon?(datetime), do: datetime.hour < 12

  @spec return_date(NaiveDateTime.t()) :: Date.t()
  def return_date(checkout_datetime) do
    NaiveDateTime.add(
      checkout_datetime,
      penality_in_seconds(before_noon?(checkout_datetime)),
      :second
    )
    |> NaiveDateTime.to_date()
  end

  def penality_in_seconds(before_noon), do: (if before_noon, do: 28, else: 29) * 24 * 60 * 60

  def days_late(planned_return_date, actual_return_datetime) do
    Date.diff(NaiveDateTime.to_date(actual_return_datetime), planned_return_date)
    |> do_days_late()
  end

  defp do_days_late(days) when days < 0, do: 0
  defp do_days_late(days), do: days

  def monday?(datetime) do
    NaiveDateTime.to_date(datetime) |> Date.day_of_week() == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout_date = datetime_from_string(checkout)
    actual_return_date = datetime_from_string(return)
    planned_return_date = return_date(checkout_date)
    do_discount(monday?(actual_return_date), days_late(planned_return_date, actual_return_date)*rate)
  end

  defp do_discount(false, fee), do: fee
  defp do_discount(true, fee), do: trunc(fee * 0.5)
end
