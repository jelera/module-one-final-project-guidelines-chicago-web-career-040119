class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.string :flight_number
      t.string :airline
      t.float :price
      t.integer :departure_city_id
      t.datetime :departure_time
      t.integer :arrival_city_id
      t.datetime :arrival_time
    end
  end
end
