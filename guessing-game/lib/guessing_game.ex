defmodule GuessingGame do
  def compare(secret_number, guess \\ :no_guess)

  def compare(secret_number, guess) when is_integer(guess) do
    diff = guess - secret_number
    cond do
      diff == 0 -> "Correct"
      abs(diff) == 1 -> "So close"
      diff > 1 -> "Too high"
      diff < 1 -> "Too low"
    end
  end

  def compare(_secret_number, guess) when is_atom(guess) do
    "Make a guess"
  end
end
