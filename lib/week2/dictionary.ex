defmodule Dictionary do
  @moduledoc """
  Write a function that, given a dictionary, would translate a sentence.
  Words not found in the dictionary need not be translated.
  """

  def translate(dictionary, sentence) do
    words = String.split(sentence, " ")

    Enum.map(words, fn word ->
      unless dictionary[word] == nil do
        dictionary[word]
      else
        word
      end
    end)
    |> Enum.join(" ")
  end
end

IO.inspect(
  Dictionary.translate(
    %{"mama" => "mother", "papa" => "father"},
    "mama is with papa"
  )
)
