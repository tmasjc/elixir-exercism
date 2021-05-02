defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """

  @spec count(String.t()) :: map
  def count(sentence) do
    strs = sentence
      |> String.downcase()
      |> String.replace(~r/@|#|\$|%|&|\^|:|_|!|,/u, " ")
      |> String.split(" ", trim: true)
    Enum.reduce(strs, Map.new(), &count_this/2)
  end

  defp count_this(word, arr) do
    Map.update(arr, word, 1, &(&1 + 1))
  end
end
