defmodule Week5.StarWarsApi.Application do
  @moduledoc """
  This is the Application module containing all the project's configurations.
  """
  alias Week5.StarWarsApi
  use Application
  require Logger

  def start(_type, _args) do
    children = [
      {Plug.Cowboy,
       scheme: :http, plug: Week5.StarWarsApi.Router, options: [port: cowboy_port()]},
      {StarWarsApi.ETS, []}
    ]

    opts = [strategy: :one_for_one, name: StarWarsApi.Supervisor]

    Logger.info("Star Wars application started ...")

    Supervisor.start_link(children, opts)
  end

  defp cowboy_port, do: Application.get_env(:star_wars_api, :cowboy_port, 8080)
end
