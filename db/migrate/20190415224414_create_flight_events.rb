class CreateFlightEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :flight_events do |t|
      t.datetime :time
      t.boolean :is_departure
      t.integer :destination_id
    end
  end
end
