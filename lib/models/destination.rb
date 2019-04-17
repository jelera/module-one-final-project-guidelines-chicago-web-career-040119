class Destination < ActiveRecord::Base
  # has_many :arrivals
  # has_many :departures
  #above no longer needed, since we created an event that incorporates them
  has_many :reviews
  has_many :users, through: :reviews
  has_many :flight_events
  has_many :flights, through: :flight_events

  def arrivals
    flights.select { |flight| flight.arrival.destination_id == id }
    
  end

  def departures
    flights.select { |flight| flight.departure.destination_id == id }
  end
end
