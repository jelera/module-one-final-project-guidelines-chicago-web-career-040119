class CreateDepartures < ActiveRecord::Migration[5.2]
  def change
    create_table :departures do |t|
      t.datetime :departure_time
      t.integer :destination_id
      t.integer :flight_id
    end
  end
end
