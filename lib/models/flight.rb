class Flight < ActiveRecord::Base
  # has_many :destinations
  belongs_to :departure_city, :class_name => "City", :foreign_key => "departure_city_id"
  belongs_to :arrival_city, :class_name => "City", :foreign_key => "arrival_city_id"

  def is_departure_flight?
    if is_departure_flight
      true
    else
      false
    end
  end

  def is_arrival_flight?
    if is_departure_flight
      false
    else
      true
    end
  end

  def duration
    arrival_time - departure_time
  end
end
