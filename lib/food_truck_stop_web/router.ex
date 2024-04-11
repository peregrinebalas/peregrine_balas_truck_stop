defmodule FoodTruckStopWeb.Router do
  use FoodTruckStopWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {FoodTruckStopWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  # TODO add authentication plug
  pipeline :api do
    plug :accepts, ["json"]
  end

  # API endpoints for food trucks
  scope "/api", FoodTruckStopWeb do
    pipe_through :api
    get "/foodtrucks/search", FoodTruckController, :search

    resources "/foodtrucks", FoodTruckController, only: [:index, :show]
  end
end
