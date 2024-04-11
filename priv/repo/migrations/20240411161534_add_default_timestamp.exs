defmodule FoodTruckStop.Repo.Migrations.AddDefaultTimestamp do
  use Ecto.Migration

  def change do
    alter table(:food_trucks) do
      modify(:inserted_at, :timestamp, default: fragment("NOW()"))
      modify(:updated_at, :timestamp, default: fragment("NOW()"))
    end
  end
end
