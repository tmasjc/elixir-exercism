defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, &(&1.price))
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, &(&1.price == nil))
  end

  def increase_quantity(item, count) do
    item.quantity_by_size
    |> Enum.map(fn {k, v} -> {k, v + count} end)
    |> Map.new()
    |> (&Map.put(item, :quantity_by_size, &1)).()
  end

  def total_quantity(item) do
    Enum.reduce(item.quantity_by_size, 0, fn {_, v}, acc -> v + acc end)
  end
end
