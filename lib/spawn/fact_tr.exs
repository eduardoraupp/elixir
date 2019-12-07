defmodule TailRecursive do
    def factorial(n), do: _fact(n, 1)
    defp _fact(0, acc), do: acc
    #1 * 3 = 3 * 2 = 6 * 1 = 6
    defp _fact(n, acc), do: _fact(n - 1, acc * n)
end
