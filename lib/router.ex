defmodule Kb.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/", do: send_resp(conn, 200, "Welcome")

  get "/list" do
    send_resp(conn, 200, Kb.Database.list(Database))
  end

  get "/search/:criteria" do
    result = Enum.map(Kb.Database.search(Database,criteria), fn {_key, value} -> Poison.encode!(value) end)
    send_resp(conn, 200, result)
  end

  delete "/delete/:id" do
    Kb.Database.delete(Database,id)
    send_resp(conn, 200, "Deleted #{id}")
  end

  match _, do: send_resp(conn, 404, "Page Not Found")

end