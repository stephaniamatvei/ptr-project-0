defmodule Week3.Averager do
  @moduledoc """
  Create an actor which receives numbers and with each request prints out the current average.

  ## How to run:

    iex(1)> pid = Week3.Averager.start(0)
    #PID<0.167.0>

    iex(2)> Week3.Averager.next
    Current average is 0
    0

    iex(3)> Week3.Averager.next
    Current average is 5.0
    5.0

  """

  def start(count) do
    pid = spawn(__MODULE__, :calculate_average, [count])
    Process.register(pid, :counter)
    pid
  end

  def next do
    ref = make_ref()
    send(:counter, {:next, self(), ref})

    receive do
      {:ok, ^ref, count} -> count
    end
  end

  def calculate_average(count) do
    receive do
      {:next, sender, ref} ->
        send(sender, {:ok, ref, count})
        IO.puts("Current average is #{count}")
        calculate_average((count + 10) / 2)
    end
  end
end
