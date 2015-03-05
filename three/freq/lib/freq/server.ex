defmodule Server do
  def start(name, args) do
    Process.register(name, spawn(server, &init, [name, args]))
  end

  def init(mod, args) do
    state = mod.init(args)
    loop(mod, state)
  end
end
