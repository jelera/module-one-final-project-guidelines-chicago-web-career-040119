class Flight < ActiveRecord::Base
  has_many :users_flights
  has_many :users, through: :users_flights

  belongs_to :arrival, class_name: 'FlightEvent'
  belongs_to :departure, class_name: 'FlightEvent'

  def duration
    arrival.time - departure.time
  end

end
