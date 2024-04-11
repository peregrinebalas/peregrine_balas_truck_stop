defmodule FoodTruckStop.Repo.Migrations.CreateFoodTrucks do
  use Ecto.Migration

  def change do
    create table(:food_trucks) do
      add :name, :string
      add :address, :string
      add :facility_type, :string
      add :food_items, :text
      add :latitude, :float
      add :longitude, :float
      add :hours, :string
      add :location_description, :string

      timestamps(type: :utc_datetime)
    end
  end
end
