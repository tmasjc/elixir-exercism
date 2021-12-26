defmodule BirdCount do
  def today(list) do
    List.first(list)
  end

  def increment_day_count(list) do
    if length(list) > 0 do
      [today(list) + 1 | tl(list)]
    else
      [1]
    end
  end

  def has_day_without_birds?(list) do
    Enum.any?(list, fn x -> x == 0 end)
  end

  def total(list) do
    Enum.sum(list)
  end

  def busy_days(list) do
    list
    |> Enum.filter(fn x -> x >= 5 end)
    |> length()
  end
end
