defmodule FreelancerRates do
  @multiplier 8.0
  @billable 22
  def daily_rate(hourly_rate) do
    hourly_rate * @multiplier
  end

  def apply_discount(before_discount, discount) do
    before_discount * (1 - discount / 100.0)
  end

  def monthly_rate(hourly_rate, discount) do
    hourly_rate
    |> daily_rate()
    |> apply_discount(discount)
    |> (&(&1 * @billable)).()
    |> Float.ceil()
    |> Kernel.trunc()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    hourly_rate
    |> daily_rate()
    |> apply_discount(discount)
    |> (&(budget / &1)).()
    |> Float.floor(1)
  end
end
