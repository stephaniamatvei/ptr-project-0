defmodule Week4.WorkerSupervisor do
  @moduledoc """
  Create a supervised pool of identical worker actors. The number of actors is static, given at initialization.
  Workers should be individually addressable. Worker actors should echo any message they receive. If an actor dies
  (by receiving a “kill” message), it should be restarted by the supervisor. Logging is welcome.

  Supervisor component.
  """

  use Supervisor

  def start_link(num_workers) do
    Supervisor.start_link(__MODULE__, num_workers: num_workers, name: __MODULE__)
    |> elem(1)
  end

  def init(args) do
    children =
      Enum.map(1..args[:num_workers], fn i ->
        %{
          id: i,
          start: {Week4.Worker, :start_link, []}
        }
      end)

    Supervisor.init(children, strategy: :one_for_one)
  end

  def get_worker_pid(pid, id) do
    Supervisor.which_children(pid)
    |> Enum.find(fn {i, _, _, _} -> i == id end)
    |> elem(1)
  end
end

# supervisor_pid = Week4.WorkerSupervisor.start_link(5)
# pid2 = Week4.WorkerSupervisor.get_worker_pid(supervisor_pid, 2)
# Week4.Worker.echo("message")
# Week4.Worker.echo("kill")
# send(pid2, :kill)
# Week4.WorkerSupervisor.get_worker_pid(pid, 1)
