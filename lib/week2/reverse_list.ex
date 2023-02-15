defmodule ReverseList do
  @moduledoc """
  Write a function to reverse a list.
  """

  def reverse_list(list) do
    reverse = Enum.reverse(list)
    IO.inspect(reverse, label: "The reversed list is")
  end
end

ReverseList.reverse_list([1, 2, 4, 8, 4])
