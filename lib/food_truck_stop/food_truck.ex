defmodule FoodTruckStop.FoodTruck do
  use Ecto.Schema
  import Ecto.Changeset

  schema "food_trucks" do
    field :block, :integer
    field :status, :string
    field :address, :string
    field :permit, :string
    field :approved, :naive_datetime
    field :y, :float
    field :x, :float
    field :location_id, :integer
    field :applicant, :string
    field :facility_type, :string
    field :cnn, :integer
    field :location_description, :string
    field :blocklot, :integer
    field :lot, :integer
    field :food_items, :string
    field :latitude, :float
    field :longitude, :float
    field :schedule, :string
    field :days_hours, :string
    field :noi_sent, :naive_datetime
    field :received, :integer
    field :expiration_date, :naive_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(food_truck, attrs) do
    food_truck
    |> cast(attrs, [
      :location_id,
      :applicant,
      :facility_type,
      :cnn,
      :location_description,
      :address,
      :blocklot,
      :block,
      :lot,
      :permit,
      :status,
      :food_items,
      :x,
      :y,
      :latitude,
      :longitude,
      :schedule,
      :days_hours,
      :noi_sent,
      :approved,
      :received,
      :expiration_date
    ])
    |> validate_required([
      :location_id,
      :applicant,
      :facility_type,
      :cnn,
      :location_description,
      :address,
      :blocklot,
      :block,
      :lot,
      :permit,
      :status,
      :food_items,
      :x,
      :y,
      :latitude,
      :longitude,
      :schedule,
      :days_hours,
      :noi_sent,
      :approved,
      :received,
      :expiration_date
    ])
  end
end
