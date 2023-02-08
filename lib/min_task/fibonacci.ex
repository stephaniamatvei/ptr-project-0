defmodule Fibonacci do
  @moduledoc """
  Write a function that returns the first n elements of the Fibonacci sequence.
  """

  def fib(0) do
    0
  end

  def fib(1) do
    1
  end

  def fib(n) when n >= 0 do
    fib(n - 1) + fib(n - 2)
  end

  def return_fibonacci_elements(x) do
    elements = for n <- 0..(x - 1), do: fib(n)
    IO.inspect(elements)
  end
end

IO.puts(Fibonacci.return_fibonacci_elements(7))
