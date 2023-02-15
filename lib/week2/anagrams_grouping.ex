defmodule AnagramsGrouping do
  @moduledoc """
  White a function that, given an array of strings, would group the anagrams together.
  """

  @spec group_anagrams(any) :: any
  def group_anagrams(list) do
    simplify = fn word -> String.graphemes(word) |> Enum.sort() |> Enum.join() end

    groups =
      list
      |> Enum.map(&simplify.(&1))
      |> Enum.uniq()
      |> Map.new(&{&1, []})

    list
    |> Enum.reduce(groups, fn x, acc -> Map.put(acc, simplify.(x), acc[simplify.(x)] ++ [x]) end)
  end
end

IO.inspect(AnagramsGrouping.group_anagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))
IO.inspect(AnagramsGrouping.group_anagrams(["gentleman", "elegant", "tnagele", "nameltneg"]))
