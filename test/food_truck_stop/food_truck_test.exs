defmodule FoodTruckStop.FoodTruckTest do
  use ExUnit.Case

  alias FoodTruckStop.FoodTruck

  @valid_attrs %{name: "some content", address: "some content", latitude: 1.1, longitude: 4.2}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = FoodTruck.changeset(%FoodTruck{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = FoodTruck.changeset(%FoodTruck{}, @invalid_attrs)
    refute changeset.valid?
  end
end
