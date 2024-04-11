defmodule FoodTruckStopWeb.FoodTruckControllerTest do
  use FoodTruckStopWeb.ConnCase
  alias FoodTruckStop.Repo

  alias FoodTruckStop.FoodTruck

  @sandwiches %{
    "address" => "some address",
    "name" => "'wich came first?",
    "latitude" => 1.1,
    "longitude" => 4.2,
    "food_items" => "sandwiches",
    "location_description" => "near",
    "facility_type" => "food truck"
  }

  @tacos %{
    "address" => "some other address",
    "name" => "taco truck",
    "latitude" => 1.4,
    "longitude" => 4.1,
    "food_items" => "tacos and stuff",
    "location_description" => "near",
    "facility_type" => "food truck"
  }

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all foodtrucks", %{conn: conn} do
      conn = get(conn, ~p"/api/foodtrucks")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "show" do
    test "returns a matching foodtruck", %{conn: conn} do
      changeset = FoodTruck.changeset(%FoodTruck{}, @sandwiches)
      {:ok, food_truck} = Repo.insert(changeset)

      conn = get(conn, ~p"/api/foodtrucks/#{food_truck.id}")
      assert json_response(conn, 200)["data"] == Enum.into(@sandwiches, %{"id" => food_truck.id})
    end

    test "returns not found when no food truck matches", %{conn: conn} do
      conn = get(conn, ~p"/api/foodtrucks/100")
      assert json_response(conn, 404)
    end
  end

  describe "search" do
    test "returns foodtrucks with items matching query", %{conn: conn} do
      changeset = FoodTruck.changeset(%FoodTruck{}, @sandwiches)
      {:ok, _food_truck} = Repo.insert(changeset)
      changeset = FoodTruck.changeset(%FoodTruck{}, @tacos)
      {:ok, food_truck} = Repo.insert(changeset)

      conn = get(conn, ~p"/api/foodtrucks/search?query=tacos")
      assert json_response(conn, 200)["data"] == [Enum.into(@tacos, %{"id" => food_truck.id})]
    end
  end
end
