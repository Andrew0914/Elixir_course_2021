
sync_query = fn(query_def) ->
  :timer.sleep(2000)
  "#{query_def} result"
  end

#v1
async_query = fn(query_def) ->
  spawn(fn -> IO.puts(sync_query.(query_def)))
end

#v2
async_query = fn (query_def) ->
  caller = self()
  spawn(fn ->
    send(caller, {:query_result, sync_query.(query_def)})  # este código corre otro proceso
  end)
end

get_result = fn ->
  receive do
    {:query_result, result} -> result
  end
end


async_queries = fn(queries) ->
  queries
  |> Enum.map(&async_query.("query #{&1}"))
  |> Enum.map(fn(_) -> get_result.() end)
end

defmodule DatabaseServer do
  def start do
    spawn(&loop/0) # el codigo que se llama aqui corre en otro proceso
  end

  defp loop do
    receive do
      {:run_query, caller, query_def} ->
        send(caller, {:query_result, sync_query(query_def)})
    end
    loop()
  end

  defp sync_query(query_def) do
    :timer.sleep(2000)
    "#{query_def} result"
  end

  # TAREA ⭐
  def send_query(server, caller, query_def) do
    send(server, {:run_query,caller, query_def })
  end

  def get_result do
    receive do
      {:query_result, result} -> IO.puts(result)
    end
  end
end
