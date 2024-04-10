defmodule FoodTruckStop.Repo do
  use Ecto.Repo,
    otp_app: :food_truck_stop,
    adapter: Ecto.Adapters.Postgres
end
