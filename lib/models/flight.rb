class Flight < ActiveRecord::Base
  has_many :users_flights
  has_many :users, through: :users_flights


  def duration
    arrival.time - departure.time
  end

  def arrival
    FlightEvent.find { |fe| fe.flight_id == id && fe.arrival? }
  end

  def departure
    FlightEvent.find { |fe| fe.flight_id == id && fe.departure? }
  end

  def arrival_dest
    arrival.destination
  end

  def departure_dest
    departure.destination
  end

  def destinations
    [arrival_dest, departure_dest]
  end



end
