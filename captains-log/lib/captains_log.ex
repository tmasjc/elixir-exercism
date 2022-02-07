defmodule CaptainsLog do
  @planetary_classes ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"]
  @prefix "NCC-"
  @start_of_stardates 41000.0
  @end_of_stardates   42000.0

  def random_planet_class() do
    Enum.random(@planetary_classes)
  end

  def random_ship_registry_number() do
    1..4
    |> Enum.map( fn _ -> 1..9 |> Enum.random |> to_string end )
    |> Enum.reduce(@prefix, &(&2 <> &1))
  end

  def random_stardate() do
    :rand.uniform * (@end_of_stardates - @start_of_stardates) + @start_of_stardates
  end

  def format_stardate(stardate) do
    :io_lib.format("~.1f", [stardate]) |> to_string
  end
end
