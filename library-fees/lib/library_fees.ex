defmodule LibraryFees do
  def datetime_from_string(string), do: NaiveDateTime.from_iso8601!(string)

  def before_noon?(datetime), do: NaiveDateTime.to_time(datetime).hour < 12

  def return_date(checkout_datetime) do

    nday = if(before_noon?(checkout_datetime), do: 28, else: 29)

    checkout_datetime
    |> NaiveDateTime.add(nday * 24 * 3600, :second)
    |> NaiveDateTime.to_date()
  end

  def days_late(planned_return_date, actual_return_datetime) do
    late = Date.diff(NaiveDateTime.to_date(actual_return_datetime), planned_return_date)
    max(0, late)
  end

  def monday?(datetime) do
    Date.day_of_week(datetime) == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout = datetime_from_string(checkout)
    return   = datetime_from_string(return)
    fee      = days_late(return_date(checkout), return) * rate
    actl_fee = if(monday?(return), do: fee * 0.5, else: fee)
    trunc(actl_fee)
  end
end
