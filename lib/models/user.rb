class User < ActiveRecord::Base
  has_many :user_flights
  has_many :flights, through: :user_flights
  has_many :reviews
  has_many :destinations, through: :reviews

  def initialize(*args)

  end
end
