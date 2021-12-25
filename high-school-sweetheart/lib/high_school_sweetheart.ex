defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name |> String.trim() |> String.first()
  end

  def initial(name) do
    name |> first_letter() |> String.upcase() |> (&(&1 <> ".")).()
  end

  def initials(full_name) do
    [f , l] = full_name |> String.split(" ") |> Enum.map(fn x -> initial(x) end)
    f <> " " <> l
  end

  def pair(full_name1, full_name2) do
    tmp =
    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     X. X.  +  X. X.     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
    String.replace(tmp, "X. X.  +  X. X.", initials(full_name1) <> "  +  " <> initials(full_name2), global: true)
  end
end
