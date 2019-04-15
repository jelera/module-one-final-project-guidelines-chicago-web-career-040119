class Departure < ActiveRecord::Base
  belongs_to :flight
  belongs_to :destination

end
