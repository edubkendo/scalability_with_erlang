defmodule Echo do
  def go do
    pid = spawn fn -> loop end
    send pid, {self(), :hello}
    receive do
      {pid, msg} -> IO.puts "#{msg}"
    end
    send pid, :stop
  end

  def loop do
    receive do
      {from, msg} ->
        send from, {self(), msg}
        loop
      :stop -> true
    end
  end
end
