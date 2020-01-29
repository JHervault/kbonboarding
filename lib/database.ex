defmodule Kb.Database do
  @moduledoc false
  use GenServer

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  @impl true
  def init(_opts) do
    :ets.new(:store, [:named_table])
    {:ok, %{}}
  end

  def put(pid, key, value) do
    GenServer.call(pid, {:put, key, value})
  end

  def get(pid, key) do
    GenServer.call(pid, {:get, key})
  end

  def delete(pid, key) do
    GenServer.call(pid, {:delete, key})
  end

  @impl true
  def handle_call({:put, key, value}, _from, state) do
    :ets.insert(:store, {key, value})
    {:reply, :ok, state}
  end

  @impl true
  def handle_call({:get, key}, _from, state) do
    {:reply, :ets.lookup(:store, key), state}
  end

  @impl true
  def handle_call({:delete, key}, _from, state) do
    :ets.delete(:store, key)
    {:reply, :ok, state}
  end

end