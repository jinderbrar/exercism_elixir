defmodule FreelancerRates do
  def daily_rate(hourly_rate), do: 8.0 * hourly_rate

  def apply_discount(before_discount, discount) do
    after_discount = before_discount - (before_discount * discount)/ 100
    1.0 * after_discount
  end

  def monthly_rate(hourly_rate, discount) do
    m_rate = 22 * daily_rate(hourly_rate)
    trunc(Float.ceil(apply_discount(m_rate, discount)))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    Float.floor(budget/apply_discount(daily_rate(hourly_rate),discount),1)
  end
end
