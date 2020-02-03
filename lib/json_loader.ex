defmodule JsonLoader do
  @moduledoc false

  def init() do
    JsonLoader.load_to_db(Database, "C:/GIT/F378535/kbonboarding/priv/orders_dump/orders_chunk0.json")
    JsonLoader.load_to_db(Database, "C:/GIT/F378535/kbonboarding/priv/orders_dump/orders_chunk1.json")
  end

  def load_to_db(_database, json_file) do
    File.read!(json_file)
    |> Poison.decode!()
    |> Enum.map(fn order ->
      Kb.Database.put(Database,order["id"], order)
    end)
  end

end
