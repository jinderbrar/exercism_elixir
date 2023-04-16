defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name
    |> String.trim("\n")
    |> String.trim("\t")
    |> String.trim
    |> String.at(0)

  end
  def initial(name) do
    name
    |> first_letter()
    |> String.upcase
    |> Kernel.<>(".")
  end

  def initials(full_name) do
    full_name
    |> String.split(" ")
    |> Enum.map(fn f -> initial(f) end)
    |> Enum.join(" ")
  end

  def pair(full_name1, full_name2) do
    a1 = initials(full_name1)
    a2 = initials(full_name2)
    b = """
           ******       ******
         **      **   **      **
       **         ** **         **
      **            *            **
      **                         **
      **     #{a1}  +  #{a2}     **
       **                       **
         **                   **
           **               **
             **           **
               **       **
                 **   **
                   ***
                    *
      """
  end
end
