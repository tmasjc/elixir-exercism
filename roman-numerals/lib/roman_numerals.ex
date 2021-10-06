defmodule RomanNumerals do
  @romana %{
    1    => "I",
    4    => "IV",
    5    => "V",
    9    => "IX",
    10   => "X",
    40   => "XL",
    50   => "L",
    90   => "XC",
    100  => "C",
    400  => "CD",
    500  => "D",
    900  => "CM",
    1000 => "M"
  }
  @keys Map.keys(@romana) |> Enum.sort(&(&1 > &2))
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(integer) :: String.t()
  def numeral(number) do
    to_roman(@keys, number, "")
  end

  # pattern matching in function
  defp to_roman(_, 0, result), do: result
  # as long as `number` is not 0
  defp to_roman([head | rest] = keys, number, result) do
    if number >= head do
      to_roman(keys, number - head, result <> @romana[head])
    else
      to_roman(rest, number, result)
    end
  end
end
