class FlightEvent < ActiveRecord::Base

  belongs_to :destination
  belongs_to :flight

  def arrival?
    !is_departure
  end

  def departure?
    is_departure
  end
end
