defmodule FoodTruckStop.FoodTruck do
  use Ecto.Schema
  import Ecto.Changeset

  schema "food_trucks" do
    field :name, :string
    field :address, :string
    field :facility_type, :string
    field :food_items, :string
    field :latitude, :float
    field :longitude, :float
    field :hours, :string
    field :location_description, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(food_truck, attrs) do
    food_truck
    |> cast(attrs, [
      :name,
      :address,
      :facility_type,
      :food_items,
      :latitude,
      :longitude,
      :hours,
      :location_description
    ])
    |> validate_required([
      :name,
      :address,
      :latitude,
      :longitude
    ])
  end
end
