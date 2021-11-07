defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    cond do
      is_blank?(input) -> "Fine. Be that way!"
      is_question?(input) and is_shouting?(input) -> "Calm down, I know what I'm doing!"
      is_question?(input) -> "Sure."
      is_shouting?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp is_blank?(input) do
    String.trim(input) == ""
  end

  defp is_question?(input) do
    input |> String.trim() |> String.ends_with?("?")
  end

  defp is_shouting?(input) do
    input == String.upcase(input) and input != String.downcase(input)
  end
end
