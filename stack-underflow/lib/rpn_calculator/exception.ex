defmodule RPNCalculator.Exception do
  defmodule DivisionByZeroError do
    defexception message: "division by zero occurred"
  end

  defmodule StackUnderflowError do
    defexception message: "stack underflow occurred"

    @impl true
    def exception([]),  do: %StackUnderflowError{}
    def exception(msg), do: %StackUnderflowError{message: "stack underflow occurred, context: " <> msg}
  end

  def divide([]),  do: raise StackUnderflowError, "when dividing"
  def divide([_]), do: raise StackUnderflowError, "when dividing"
  def divide([0, _]), do: raise DivisionByZeroError, "division by zero occurred"
  def divide([a, b]), do: b / a
end
