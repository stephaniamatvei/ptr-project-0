defmodule ListRotation do
  @moduledoc """
  Write a function that would rotate a list n places to the left.
  """

  def rotate_left(enumerable, shift) do
    {left, right} = Enum.split(enumerable, shift)
    right ++ left
  end
end

IO.inspect(ListRotation.rotate_left([1, 2, 4, 8, 4], 3))
