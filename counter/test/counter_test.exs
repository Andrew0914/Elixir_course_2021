defmodule CounterTest do
  use ExUnit.Case
  doctest Counter

  test "greets the world" do
    assert Counter.hello() == :world
  end

  test "cuenta palabras de un archivo" do
    assert Counter.count_lines("words") == {:ok, 235_886}
  end
end
