defmodule Lasagna do
  @fullminutes 40
  def expected_minutes_in_oven(), do: @fullminutes
  def remaining_minutes_in_oven(mins), do: @fullminutes - mins
  def preparation_time_in_minutes(layers), do: layers * 2
  def total_time_in_minutes(layers, mins), do: mins + preparation_time_in_minutes(layers)
  def alarm(), do:  "Ding!"
end
