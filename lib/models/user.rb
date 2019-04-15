class User < ActiveRecord::Base
  has_many :users_flights
  has_many :flights, through: :users_flights
  has_many :reviews
  has_many :destinations, through: :reviews

end
