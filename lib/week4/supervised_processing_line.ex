defmodule Week4.SupervisedProcessingLine do
  @moduledoc """
  Create a supervised processing line to clean messy strings.
  The first worker in the line would split the string by any white spaces (similar to Python’s `str.split` method).
  The second actor will lowercase all words and swap all m’s and n’s (you nomster!).
  The third actor will join back the sentence with one space between words (similar to Python’s `str.join` method).
  Each worker will receive as input the previous actor’s output, the last actor printing the result on screen.
  If any of the workers die because it encounters an error, the whole processing line needs to be restarted.
  Logging is welcome.

  ## Example

    iex(1)> Week4.SupervisedProcessingLine.start_pipeline("ThiS is ThE MaiN TASK for wEEk 4")
    "this is the naim task for week 4"
  """

  require Logger

  def start_pipeline(input_str) do
    with {:ok, words} <- split_string(input_str),
         {:ok, swapped_words} <- swap_m_n_and_lowercase(words),
         {:ok, result} <- join_words(swapped_words) do
      result
    else
      error ->
        Logger.error("Error in pipeline: #{error}")
        start_pipeline(input_str)
    end
  end

  defp split_string(input_str) do
    try do
      {:ok, input_str |> String.split()}
    rescue
      e ->
        Logger.error("Error in split_string worker: #{e}")
        {:error, e}
    end
  end

  defp swap_m_n_and_lowercase(words) do
    try do
      swapped_words =
        words
        |> Enum.map(&String.downcase/1)
        |> Enum.map(
          &(String.replace(&1, "m", " ")
            |> String.replace("n", "m")
            |> String.replace(" ", "n"))
        )

      {:ok, swapped_words}
    rescue
      e ->
        Logger.error("Error in swap_m_n_and_lowercase worker: #{e}")
        {:error, e}
    end
  end

  defp join_words(swapped_words) do
    try do
      {:ok, swapped_words |> Enum.join(" ")}
    rescue
      e ->
        Logger.error("Error in join_words worker: #{e}")
        {:error, e}
    end
  end
end
