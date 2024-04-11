defmodule FoodTruckStopWeb.FoodTruckJSON do
  alias FoodTruckStop.FoodTruck

  @doc """
  Renders a list of foodtrucks.
  """
  def index(%{foodtrucks: foodtrucks}) do
    %{data: for(food_truck <- foodtrucks, do: data(food_truck))}
  end

  @doc """
  Renders a single food_truck.
  """
  def show(%{foodtruck: foodtruck}) do
    %{data: data(foodtruck)}
  end

  defp data(%FoodTruck{} = foodtruck) do
    %{
      id: foodtruck.id,
      name: foodtruck.name,
      address: foodtruck.address,
      latitude: foodtruck.latitude,
      longitude: foodtruck.longitude,
      food_items: foodtruck.food_items,
      location_description: foodtruck.location_description,
      facility_type: foodtruck.facility_type
    }
  end
end
