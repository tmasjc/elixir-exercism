defmodule Username do

  @spec sanitize(charlist()) :: charlist()
  def sanitize(username), do: sanitize(username, [])

  defp sanitize([], acc), do: acc

  defp sanitize([head | tail], acc), do: sanitize(tail, acc ++ transform_char(head))

  defp transform_char(char) do
    case char do
      ?ä -> 'ae'
      ?ö -> 'oe'
      ?ü -> 'ue'
      ?ß -> 'ss'
      c when (c >= ?a and c <= ?z) or c == ?_ -> [c]
      _ -> []
    end
  end
end
