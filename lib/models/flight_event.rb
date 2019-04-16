class FlightEvent < ActiveRecord::Base
  
  belongs_to :destination

  def arrival?
    !departure
  end

  def departure?
    departure
  end


  def flight
    if departure
      Flight.find_by(departure_id: id)
    else
      Flight.find_by(arrival_id: id)
    end
  end

end
