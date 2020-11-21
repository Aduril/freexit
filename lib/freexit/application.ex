defmodule Freexit.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Freexit.Repo,
      # Start the Telemetry supervisor
      FreexitWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Freexit.PubSub},
      # Start the Endpoint (http/https)
      FreexitWeb.Endpoint
      # Start a worker by calling: Freexit.Worker.start_link(arg)
      # {Freexit.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Freexit.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    FreexitWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
