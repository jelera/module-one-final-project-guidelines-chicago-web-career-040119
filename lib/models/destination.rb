class Destination < ActiveRecord::Base
  has_many :arrivals
  has_many :departures
  has_many :reviews
  has_many :users, through: :reviews
end
