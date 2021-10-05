defmodule AnagramTest do
  use ExUnit.Case
  doctest Anagram

  test "this works" do
    assert Anagram.is_anagram?("abc", "CBA") == true
  end

  assert_raise FunctionClauseError, fn ->
    Anagram.is_anagram?("abc", :abc) == true
  end
end
