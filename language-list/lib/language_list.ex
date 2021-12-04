defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove(list) do
    if(length(list) == 1, do: [], else: list -- [hd(list)])
  end

  def first(list) do
    hd(list)
  end

  def count(list) do
    length(list)
  end

  def exciting_list?(list) do
    "Elixir" in list
  end
end
