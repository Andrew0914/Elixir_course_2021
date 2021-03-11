defmodule Counter do
  def count_lines(filePath) do
    # Este programa lee y cuando la cantidad de lineas del archivo words
    num_lines = File.read!(filePath)
    |> String.split()
    |> Enum.count()
    {:ok, num_lines}
  end
end
# TODO imprimir por valores la tupla que devuelve
#{:ok, count} = Counter.count_lines()
#IO.puts(count)
