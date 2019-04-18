class City < ActiveRecord::Base
  has_many :destinations
  has_many :flights
  belongs_to :departing_flight, :class_name => "Flight", :foreign_key => "departing_flight_id"
  belongs_to :arriving_flight, :class_name => "Flight", :foreign_key => "arriving_flight_id"

end
