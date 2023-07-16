defmodule StepstreakElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      StepstreakElixirWeb.Telemetry,
      # Start the Ecto repository
      StepstreakElixir.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: StepstreakElixir.PubSub},
      # Start Finch
      {Finch, name: StepstreakElixir.Finch},
      # Start the Endpoint (http/https)
      StepstreakElixirWeb.Endpoint
      # Start a worker by calling: StepstreakElixir.Worker.start_link(arg)
      # {StepstreakElixir.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: StepstreakElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    StepstreakElixirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
