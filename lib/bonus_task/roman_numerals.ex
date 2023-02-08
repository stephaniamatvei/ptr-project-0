defmodule RomanNumerals do
  @moduledoc """
  Write a function to convert arabic numbers to roman numerals.
  """

  @mappings [{"X", 10}, {"IX", 9}, {"V", 5}, {"IV", 4}, {"I", 1}]

  def convert(number) do
    {0, str} =
      for {roman, arabic} <- @mappings, reduce: {number, ""} do
        {num, str} -> {rem(num, arabic), str <> String.duplicate(roman, div(num, arabic))}
      end

    str
  end
end

IO.inspect(RomanNumerals.convert(27))
