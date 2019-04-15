class Flight < ActiveRecord::Base
  has_many :users_flights
  has_many :users, through: :users_flights

end
