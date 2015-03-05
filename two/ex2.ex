defmodule Ex2 do
  def print_all([]) do
    :io.format("~n")
  end
  def print_all([x|xs]) do
    :io.format("~p\t", [x])
    print_all(xs)
  end
end
