# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# The fixture for food truck data is read and each row decoded and parsed
# before being seeded into the database as FoodTruck records.

alias FoodTruckStop.DatabaseSeeder

"../../fixtures/Mobile_Food_Facility_Permit.csv"
|> Path.expand(__DIR__)
|> File.stream!()
|> CSV.decode(headers: true)
|> Enum.map(fn {:ok, row} -> DatabaseSeeder.format_row(row) end)
|> DatabaseSeeder.seed()
