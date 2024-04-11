defmodule FoodTruckStop.DatabaseSeeder do
  alias FoodTruckStop.FoodTruck
  alias FoodTruckStop.Repo

  @moduledoc """
  This module contains functions for seeding FoodTruck data into the Postgres database.
  """

  @spec seed(maybe_improper_list() | Ecto.Query.t()) :: :ok
  def seed(records) do
    {count, _} = Repo.insert_all(FoodTruck, records)
    IO.puts("Successfully inserted #{count} FoodTruck records into #{Repo.config()[:database]}")
  end

  @spec format_row(map()) :: map()
  def format_row(row) do
    %{
      name: row["Applicant"],
      address: row["Address"],
      facility_type: row["FacilityType"],
      food_items: row["FoodItems"],
      latitude: parse_coordinate(row["Latitude"]),
      longitude: parse_coordinate(row["Longitude"]),
      hours: row["dayshours"],
      location_description: row["LocationDescription"]
    }
  end

  @spec parse_coordinate(binary()) :: float()
  defp parse_coordinate(str_coord) do
    {coord, _} = Float.parse(str_coord)
    coord
  end
end
