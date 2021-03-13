
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
    connection = :random.uniform(1000)
    spawn(fn -> loop(connection) end)
  end

  defp loop(connection) do
    receive do
      {:run_query, caller, query_def} ->
        send(caller, {:query_result, sync_query(connection, query_def)})
    end
    loop(connection)
  end

  defp sync_query(connection, query_def) do
    :timer.sleep(2000)
    "Connection: #{connection} : #{query_def} result"
  end

  # TAREA ⭐
  def send_query(server_pid, query_def) do
    send(server_pid, {:run_query, self(), query_def })
  end

  def get_result do
    receive do
      {:query_result, result} -> result
    after 5000 ->
      {:error, :timeout}
    end
  end
end

# Procesos concurrentes

pool = 1..100 |>
  Enum.map(fn(_) -> DatabaseServer.start end)

1..100 |>
  Enum.each(fn(query_def) ->
    server_pid = Enum.at(pool, :random.uniform(100) -1)
    DatabaseServer.send_query(server_pid, query_def)
  end)
