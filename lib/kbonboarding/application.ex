defmodule Kb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Kb.DatabaseSupervisor,
      Plug.Adapters.Cowboy.child_spec(:http,Kb.Router, [], [port: 4001])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Kb.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
