defmodule Week3.Monitor do
  @moduledoc """
  Create a two actors, actor one ”monitoring” the other.
  If the second actor stops, actor one gets notified via a message.
  """

  @doc """
  We can establish a link between two processes at any time with Process.link().
  Here’s a small actor that we can use to investigate how links behave:
  """
  def loop do
    receive do
      {:exit_because, reason} -> exit(reason)
      {:link_to, pid} -> Process.link(pid)
      {:EXIT, pid, reason} -> IO.puts("Process #{inspect(pid)} exited because #{reason}")
    end

    loop()
  end

  @doc """
  This function allows a process to trap another’s exit by setting its :trap_exit flag.
  For example, we will use `loop_system()` to start pid1. Not only does this mean that it’s
  notified when pid2 has exited (and prints a message to that effect), but it also continues to execute.
  """
  def loop_system do
    Process.flag(:trap_exit, true)
    loop()
  end
end

# pid1 = spawn(Week3.Monitor, :loop_system, [])
# pid2 = spawn(Week3.Monitor, :loop, [])
# send(pid1, {:link_to, pid2})
# send(pid2, {:exit_because, :yet_another_bad_thing_happened})
# Process.info(pid2, :status)
# Process.info(pid1, :status)
