defmodule CaesarCipher do
  @moduledoc """
  Create a pair of functions to `encode/2` and `decode/2` strings using the Caesar cipher.
  """

  @spec encode(message :: String.t(), shift :: integer) :: String.t()
  def encode(message, shift) do
    message
    |> to_charlist()
    |> Enum.map(&apply_encode_shift(&1, shift))
    |> to_string()
  end

  defp apply_encode_shift(letter, shift) do
    cond do
      letter in ?A..?Z -> ?A + rem(letter - ?A + shift, 26)
      letter in ?a..?z -> ?a + rem(letter - ?a + shift, 26)
      true -> letter
    end
  end

  @spec decode(message :: String.t(), shift :: integer) :: String.t()
  def decode(message, shift) do
    message
    |> to_charlist()
    |> Enum.map(&apply_decode_shift(&1, shift))
    |> to_string()
  end

  defp apply_decode_shift(letter, shift) do
    cond do
      letter in ?A..?Z -> ?A + rem(letter - ?A - shift, 26)
      letter in ?a..?z -> ?a + rem(letter - ?a - shift, 26)
      true -> letter
    end
  end
end

IO.inspect(CaesarCipher.encode("lorem", 3))
IO.inspect(CaesarCipher.decode("oruhp", 3))
