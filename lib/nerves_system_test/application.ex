defmodule NervesSystemTest.Application do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      # worker(NervesSystemTest.Worker, [arg1, arg2, arg3]),
      worker(Nerves.System.Test.Server, []),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: NervesSystemTest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
