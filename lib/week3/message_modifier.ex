defmodule Week3.MessageModifier do
  @moduledoc """
  Create an actor that returns any message it receives, while modifying it.

  ## How to run:

    iex(1)> pid = spawn(Week3.MessageModifier, :handle_input, [])
    #PID<0.167.0>

    iex(2)> send(pid, 10)
    Received: 11
    10

    iex(3)> send(pid, "Hello")
    Received: hello
    "Hello"

    iex(4)> send(pid, {10, "Hello"})
    Received: I don't know how to HANDLE this!
    {10, "Hello"}

  """

  def handle_input do
    receive do
      input when is_integer(input) ->
        IO.puts("Received: #{input + 1}")

      input when is_bitstring(input) ->
        IO.puts("Received: #{String.downcase(input)}")

      _ ->
        IO.puts("Received: I don't know how to HANDLE this!")
    end

    handle_input()
  end
end
