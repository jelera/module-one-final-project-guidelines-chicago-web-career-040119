class City < ActiveRecord::Base
  has_many :destinations
  has_many :departure_flights, :class_name => "Flight", :foreign_key => "departure_city_id"
  has_many :arrival_flights, :class_name => "Flight", :foreign_key => "arrival_city_id"

  def flights
    self.departure_flights + self.arrival_flights
  end


end
