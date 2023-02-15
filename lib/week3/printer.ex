defmodule Printer do
  @moduledoc """
  Create an actor that prints on the screen any message it receives.

  ## How to run:

    iex(1)> pid = spawn(Printer, :print, [])
    #PID<0.167.0>

    iex(2)> send(pid, "hello")
    "hello"

  """

  def print do
    receive do
      {input} -> IO.puts("#{input}")
    end
    print()
  end

end

