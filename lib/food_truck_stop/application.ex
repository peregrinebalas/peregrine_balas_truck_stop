defmodule FoodTruckStop.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      FoodTruckStopWeb.Telemetry,
      FoodTruckStop.Repo,
      {DNSCluster, query: Application.get_env(:food_truck_stop, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: FoodTruckStop.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: FoodTruckStop.Finch},
      # Start a worker by calling: FoodTruckStop.Worker.start_link(arg)
      # {FoodTruckStop.Worker, arg},
      # Start to serve requests, typically the last entry
      FoodTruckStopWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FoodTruckStop.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FoodTruckStopWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
