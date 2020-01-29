defmodule DatabaseTest do
  use ExUnit.Case

  @moduletag :capture_log

  test "crud works" do
    {:ok, pid} = Kb.Database.start_link({},[])

    Kb.Database.put(pid,1,"test")
    [{_,value}] = Kb.Database.get(pid,1);
    assert value == "test"

    Kb.Database.put(pid,1,"pwa")
    [{_,value}] = Kb.Database.get(pid,1);
    assert value == "pwa"

    Kb.Database.delete(pid,1)
    assert Kb.Database.get(pid,1) == [];

  end
end
