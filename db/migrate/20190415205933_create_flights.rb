class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.string :flight_number
      t.string :airline
      t.float :price
    end
  end
end
