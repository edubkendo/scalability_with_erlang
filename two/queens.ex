defmodule Queens do
  def queens(0) do
    [[]]
  end
  def queens(n) do
    for columns <- queens(n - 1), val <- [1, 2, 3, 4, 5, 6, 7, 8] -- columns, safe(val, columns, 1) do
      [ val | columns ]
    end
  end

  def safe(_val, [], _n) do
    true
  end
  def safe(val, [column|columns], n) do
    (val != column + n) and (val != column - n) and safe(val , columns , (n + 1))
  end
end
