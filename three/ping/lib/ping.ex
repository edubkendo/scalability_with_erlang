defmodule Ping do
  use GenServer

  @timeout 5000

  def init(_args), do: {:ok, :null, @timeout}

  def handle_call(:start, _from, loop_data) do
    {:reply, :started, loop_data, @timeout}
  end
  def handle_call(:pause, _from, loop_data) do
    {:reply, :paused, loop_data}
  end

  def handle_info(:timeout, loop_data) do
    {_hour, _min, sec} = :erlang.time
    IO.puts "#{sec}"
    {:noreply, loop_data, @timeout}
  end
end
