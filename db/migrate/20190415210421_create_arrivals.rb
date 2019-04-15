class CreateArrivals < ActiveRecord::Migration[5.2]
  def change
    create_table :arrivals do |t|
      t.datetime :arrival_time
      t.integer :destination_id
      t.integer :flight_id
    end
  end
end
