defmodule SmallestNumber do
  @moduledoc """
  Write a function that receives as input three digits and arranges them in an order
  that would create the smallest possible number. Numbers cannot start with a 0.
  """

  def get_smallest_number(a, b, c) do
    [a, b, c] |> Enum.sort() |> get_smallest_number() |> Enum.join() |> String.to_integer()
  end

  defp get_smallest_number([0, 0, z]) do
    [z, 0, 0]
  end

  defp get_smallest_number([0, y, z]) do
    [y, 0, z]
  end

  defp get_smallest_number([x, y, z]) do
    [x, y, z]
  end
end

IO.inspect(SmallestNumber.get_smallest_number(3, 1, 0))
