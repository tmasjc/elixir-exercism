defmodule Anagram do
  @moduledoc """
  Documentation for `Anagram`.
  """

  @doc """
  Check if two strings are Anagrams.

  A and B are considered Anagrams if A can be rearrange to B.
  """
  @spec is_anagram?(String.t(), String.t()) :: boolean()
  def is_anagram?(a, b) when is_binary(a) and is_binary(b) do
    sort_string(a) == sort_string(b)
  end

  defp sort_string(string) do
    string
    |> String.downcase()
    |> String.graphemes()
    |> Enum.sort()
  end

end
