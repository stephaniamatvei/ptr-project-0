defmodule PythagoreanTheorem do
  @moduledoc """
  Write a function that lists all tuples a, b, c such that a^2 + b^2 = c^2 and a, b ≤ 20.
  """

  def list_right_angle_triangles, do: Enum.filter(triples(), &is_pythagorean_triple/1)

  defp triples do
    for a <- 1..20, b <- a..20, c <- b..20, do: {a, b, c}
  end

  defp is_pythagorean_triple({a, b, c}) do
    a * a + b * b == c * c
  end
end

IO.inspect(PythagoreanTheorem.list_right_angle_triangles())
