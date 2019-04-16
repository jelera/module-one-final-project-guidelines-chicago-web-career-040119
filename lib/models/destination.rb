class Destination < ActiveRecord::Base
  # has_many :arrivals
  # has_many :departures
  #above no longer needed, since we created an event that incorporates them
  has_many :reviews
  has_many :users, through: :reviews
  has_many :flight_events

  def flights
    flight_events.map(:flight)
  end

  def arrivals
    flight_events.select { |event| event.arrival? }.map(&:flight)
  end

  def departures
    flight_events.select { |event| event.departure? }.map(&:flight)
  end
end
