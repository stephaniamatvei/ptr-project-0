defmodule Week3.BlockingQueue do
  @moduledoc """
  Create an actor which maintains a simple FIFO queue. You should write helper
  functions to create an API for the user, which hides how the queue is implemented.

  ## How to run:

    iex(1)> {:ok, pid} = Week3.BlockingQueue.start_link()
    {:ok, #PID<0.161.0>}

    iex(2)> Week3.BlockingQueue.push(pid, 1)
    :ok

    iex(3)> Week3.BlockingQueue.pop(pid)
    1

  """

  use GenServer

  @empty_queue :queue.new()
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, nil, opts)
  end

  def push(blocking_queue, item) do
    GenServer.call(blocking_queue, {:push, item})
  end

  def pop(blocking_queue) do
    GenServer.call(blocking_queue, :pop, :infinity)
  end

  @impl true
  def init(_items) do
    {
      :ok,
      {
        # items queue
        :queue.new(),
        # processes waiting for item
        :queue.new()
      }
    }
  end

  @impl true
  def handle_call({:push, item}, _from, {items, refs}) do
    {:reply, :ok, {:queue.in(item, items), refs}, {:continue, :pop}}
  end

  @impl true
  def handle_call(:pop, from, {items, refs}) do
    {:noreply, {items, :queue.in(from, refs)}, {:continue, :pop}}
  end

  # When there’s no items in the items queue, we do nothing and just keep the callers waiting.
  @impl true
  def handle_continue(:pop, {@empty_queue, _refs} = state) do
    {:noreply, state}
  end

  # When there’s no processes waiting for items, we do nothing.
  def handle_continue(:pop, {_items, @empty_queue} = state) do
    {:noreply, state}
  end

  # When both an item and a process waiting for an item are available, we send the item to the process,
  # and recursively check whether there are more jobs to do by returning {:noreply, new_state, {:continue, term}}.
  def handle_continue(:pop, {items, refs}) do
    {{:value, item}, items} = :queue.out(items)
    {{:value, ref}, refs} = :queue.out(refs)
    GenServer.reply(ref, item)
    {:noreply, {items, refs}, {:continue, :pop}}
  end
end
