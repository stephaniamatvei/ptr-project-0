defmodule UniqueElementsSUm do
  @moduledoc """
  Write a function to calculate the sum of unique elements in a list.
  """

  def calculate_unique_sum(list) do
    sum = Enum.uniq(list) |> Enum.sum()

    IO.inspect(sum, label: "The sum of unique elements in the list is")
  end
end

UniqueElementsSUm.calculate_unique_sum([1, 2, 4, 8, 4, 2])
