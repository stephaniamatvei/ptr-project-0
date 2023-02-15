defmodule Semaphore do
  @moduledoc """
  Create a module that would implement a semaphore.

  ## How to run:

    iex(1)> pid = spawn(Semaphore, :semaphore, [3])
    #PID<0.167.0>

    iex(2)> Semaphore.request(pid)
    :ok

  """

  def semaphore(0) do
    receive do
      :release ->
        semaphore(1)
    end
  end

  def semaphore(n) do
    receive do
      {:request, from} ->
        send(from, :granted)
        semaphore(n - 1)

      :release ->
        semaphore(n + 1)
    end
  end

  def request(semaphore) do
    send(semaphore, {:request, self()})

    receive do
      :granted ->
        :ok
    end
  end
end
