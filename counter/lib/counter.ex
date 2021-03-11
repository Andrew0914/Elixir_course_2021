defmodule Counter do
  @moduledoc """
  Documentation for `Counter`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Counter.hello()
      :world

  """
  def hello do
    :world
  end

  def main(args) do
    {:ok, result} = count_lines(Enum.at(args, 0))
    IO.puts(result)
  end

  @doc """
  Este programa lee y cuando la cantidad de lineas del archivo words

  ## Examples

      iex> Counter.count_lines("words")
      {:ok, 235886}

  """
  def count_lines(filePath \\ "words") do
    num_lines =
      File.read!(filePath)
      |> String.split()
      |> Enum.count()

    {:ok, num_lines}
  end

  def count_binary(file_name) do
    content = File.read!(file_name)
    hash = :crypto.hash(:md5, content)
    {:ok, byte_size(hash)}
  end
end

defmodule HelloWorld do
  def greet do
    receive do
      {sender, msg} -> send(sender, {:ok, "Hello, #{msg}"})
    end
    greet
  end
end
