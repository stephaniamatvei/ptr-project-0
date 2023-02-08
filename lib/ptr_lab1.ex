defmodule PtrLab1 do
  @moduledoc """
  Documentation for `PtrLab1`.
  """

  @spec hello :: :world
  @doc """
  Hello world.

  ## Examples

      iex> PtrLab1.hello()
      :world

  """
  def hello do
    :world
  end
end

IO.puts(PtrLab1.hello())
