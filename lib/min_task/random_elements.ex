defmodule RandomElements do
  @moduledoc """
  Write a function that extracts a given number of randomly selected elements from a list.
  """

  def extract_random_elements(list, n) do
    random_elements = Enum.take_random(list, n)
    IO.inspect(random_elements, label: "The randomly selected elements from the list are")
  end
end

RandomElements.extract_random_elements([1, 2, 4, 8, 4], 3)
