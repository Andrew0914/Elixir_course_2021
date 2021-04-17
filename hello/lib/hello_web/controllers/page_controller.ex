defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def index(conn, _params) do
    IO.inspect(self())
    render(conn, "index.html")
  end
end
