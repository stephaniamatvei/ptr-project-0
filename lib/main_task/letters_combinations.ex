defmodule LettersCombinations do
  @moduledoc """
  White a function that, given a string of digits from 2 to 9, would return all possible
  letter combinations that the number could represent (think phones with buttons).
  """

  def get_letters_combinations(digits_string) do
    dictionary = %{
      "2" => ["a", "b", "c"],
      "3" => ["d", "e", "f"],
      "4" => ["g", "h", "i"],
      "5" => ["j", "k", "l"],
      "6" => ["m", "n", "o"],
      "7" => ["p", "q", "r", "s"],
      "8" => ["t", "u", "v"],
      "9" => ["w", "x", "y", "z"]
    }

    letter_expansion = fn
      {digits_string, func} ->
        func.({tl(digits_string), dictionary[hd(digits_string)], func})

      {[], acc, _func} ->
        acc

      {digits_string, acc, func} ->
        func.({
          tl(digits_string),
          Enum.map(acc, fn word ->
            Enum.map(dictionary[hd(digits_string)], fn letter -> word <> letter end)
          end)
          |> Enum.concat(),
          func
        })
    end

    letter_expansion.({digits_string |> String.graphemes(), letter_expansion})
  end
end

IO.inspect(LettersCombinations.get_letters_combinations("23"))
