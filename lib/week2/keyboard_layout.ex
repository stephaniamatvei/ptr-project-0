defmodule KeyboardLayout do
  @moduledoc """
  Write a function that, given an array of strings, will return the words that
  can be typed using only one row of the letters on an English keyboard layout.
  """

  def line_words(words) do
    row1 = "qwertyuiop"
    row2 = "asdfghjkl"
    row3 = "zxcvbnm"

    words
    |> Enum.filter(fn word ->
      chars = word |> String.downcase() |> String.split("")

      row1_chars = Enum.filter(chars, &String.contains?(row1, &1))
      row2_chars = Enum.filter(chars, &String.contains?(row2, &1))
      row3_chars = Enum.filter(chars, &String.contains?(row3, &1))

      length(row1_chars) == length(chars) || length(row2_chars) == length(chars) ||
        length(row3_chars) == length(chars)
    end)
  end
end

IO.inspect(KeyboardLayout.line_words(["Hello", "Alaska", "Dad", "Peace"]))
