defmodule BlockingQueueTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, pid} = BlockingQueue.start_link()
    {:ok, bq: pid}
  end

  test "BlockingQueue should be FIFO", %{bq: pid} do
    BlockingQueue.push(pid, 1)
    BlockingQueue.push(pid, 2)
    BlockingQueue.push(pid, 3)
    assert 1 == BlockingQueue.pop(pid)
    assert 2 == BlockingQueue.pop(pid)
    assert 3 == BlockingQueue.pop(pid)
  end

  test "BlockingQueue.pop/1 should block when the queue is empty", %{bq: pid} do
    # Spawn a process that pushes an item to the queue 6 seconds later
    spawn_link(fn->
      Process.sleep(6_000)  # sleep 6 seconds
      BlockingQueue.push(pid, "Hi")
    end)
    {time, _} = :timer.tc(fn->
      assert "Hi" == BlockingQueue.pop(pid)
    end)
    assert time > 5_000_000  # `pop` should block more than 5 seconds (which is the default timeout for GenServer.call)
  end
  
end
