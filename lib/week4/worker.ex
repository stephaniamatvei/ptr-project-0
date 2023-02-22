defmodule Week4.Worker do
  @moduledoc """
  Create a supervised pool of identical worker actors. The number of actors is static, given at initialization.
  Workers should be individually addressable. Worker actors should echo any message they receive. If an actor dies
  (by receiving a “kill” message), it should be restarted by the supervisor. Logging is welcome.

  Worker component.
  """

  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [])
  end

  def init(state) do
    {:ok, state}
  end

  def handle_call(message, _from, state) do
    {:reply, message, state}
  end

  def echo(message) do
    if message == "kill" do
      Process.exit(self(), "kill")
    else
      IO.inspect(message)
    end
  end
end
