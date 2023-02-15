defmodule WorkerNode do
  @moduledoc """
  Create a module that would perform some risky business. Start by creating a scheduler actor.
  When receiving a task to do, it will create a worker node that will perform the task.
  Given the nature of the task, the worker node is prone to crashes (task completion rate 50%).
  If the scheduler detects a crash, it will log it and restart the worker node.
  If the worker node finishes successfully, it should print the result.

  ## How to run:

    iex(1)> children = [
    ...(1)>   %{
    ...(1)>     id: WorkerNode,
    ...(1)>     start: {WorkerNode, :start_link, [[:hello]]}
    ...(1)>   }
    ...(1)> ]
    [%{id: WorkerNode, start: {WorkerNode, :start_link, [[:hello]]}}]

    iex(2)> Supervisor.start_link(children, strategy: :one_for_one)
    {:ok, #PID<0.167.0>}

    iex(3)> GenServer.call(WorkerNode, :pop)
    "Task succesful: Miau"
    :hello
    

    P.S. Sometimes the last command you will return fail due to 50% task completion rate.

  """

  use GenServer

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def go_boom do
    if Enum.random([true, false]) do
      IO.inspect("Test fail")
      exit(:boom)
    end
  end

  ## Callbacks

  @impl true
  def init(stack) do
    {:ok, stack}
  end

  @impl true
  def handle_call(:pop, _from, [head | tail]) do
    go_boom()
    IO.inspect("Task succesful: Miau")
    {:reply, head, tail}
  end

end
