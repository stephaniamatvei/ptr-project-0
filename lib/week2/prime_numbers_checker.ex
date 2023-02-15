defmodule PrimeNumbersChecker do
  @moduledoc """
  Write a function that determines whether an input integer is prime.
  """

  def is_prime(2) do
    true
  end

  def is_prime(number) do
    not Enum.any?(2..(number - 1), fn x -> rem(number, x) == 0 end)
  end
end

IO.inspect(PrimeNumbersChecker.is_prime(13))
