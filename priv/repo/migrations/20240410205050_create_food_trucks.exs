defmodule FoodTruckStop.Repo.Migrations.CreateFoodTrucks do
  use Ecto.Migration

  def change do
    create table(:food_trucks) do
      add :location_id, :integer
      add :applicant, :string
      add :facility_type, :string
      add :cnn, :integer
      add :location_description, :string
      add :address, :string
      add :blocklot, :integer
      add :block, :integer
      add :lot, :integer
      add :permit, :string
      add :status, :string
      add :food_items, :string
      add :x, :float
      add :y, :float
      add :latitude, :float
      add :longitude, :float
      add :schedule, :string
      add :days_hours, :string
      add :noi_sent, :naive_datetime
      add :approved, :naive_datetime
      add :received, :integer
      add :expiration_date, :naive_datetime

      timestamps(type: :utc_datetime)
    end
  end
end
