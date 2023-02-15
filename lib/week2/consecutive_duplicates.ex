defmodule ConsecutiveDuplicates do
  @moduledoc """
  Write a function that eliminates consecutive duplicates in a list.
  """

  def remove_consecutive_duplicates(list) do
    new_list = Enum.dedup(list)
    IO.inspect(new_list, label: "The new list without consecutive duplicates")
  end
end

ConsecutiveDuplicates.remove_consecutive_duplicates([1, 2, 2, 2, 4, 8, 4])
