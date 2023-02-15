defmodule CylinderArea do
  @moduledoc """
  Write a function to calculate the area of a cylinder, given it’s height and radius.
  """

  def calculate_cylinder_area(height, radius) do
    cylinder_area = 2 * :math.pi() * radius * height + 2 * :math.pi() * :math.pow(radius, 2)
    IO.inspect(cylinder_area, label: "The area of the cylinder is")
  end
end

CylinderArea.calculate_cylinder_area(3, 4)
