defmodule LucasNumbers do
  def generate(arg) when is_bitstring(arg) or arg < 1,
    do: raise(ArgumentError, "count must be specified as an integer >= 1")

  def generate(n) when is_integer(n),
    do: Enum.to_list(generate_stream(n))

  defp generate_stream(n), do: Stream.map(1..n, &number(&1))
  defp number(1), do: 2
  defp number(2), do: 1
  defp number(n), do: number(n - 2) + number(n - 1)
end
