defmodule FoodTruckStopWeb.FoodTruckController do
  use FoodTruckStopWeb, :controller
  import Ecto.Query

  alias FoodTruckStop.Repo
  alias FoodTruckStop.FoodTruck

  action_fallback FoodTruckStopWeb.FallbackController

  @doc """
  Return a list of all food trucks.
  """
  @spec index(Plug.Conn.t(), any()) :: Plug.Conn.t()
  def index(conn, _params) do
    # TODO add pagination
    render(conn, :index, foodtrucks: Repo.all(FoodTruck))
  end

  @doc """
  Get a food truck with matching id or return not found.
  """
  @spec show(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def show(conn, %{"id" => id}) do
    foodtruck = Repo.get(FoodTruck, id)

    case foodtruck do
      %FoodTruck{} ->
        render(conn, :show, foodtruck: foodtruck)

      nil ->
        conn
        |> put_status(:not_found)
        |> put_view(json: FoodTruckStopWeb.ErrorJSON)
        |> render(:"404")
    end
  end

  @doc """
  Search for food trucks with matching food items.
  """
  def search(conn, %{"query" => query}) do
    # TODO update for name search as well
    food_items = "%#{query}%"

    # TODO separate query into context module
    foodtrucks =
      from(ft in FoodTruck,
        where: like(ft.food_items, ^food_items)
      )
      |> Repo.all()

    render(conn, :index, foodtrucks: foodtrucks)
  end
end
