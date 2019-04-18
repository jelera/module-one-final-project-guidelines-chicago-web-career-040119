class User < ActiveRecord::Base
  has_many :user_flights
  has_many :flights, through: :user_flights
  has_many :reviews
  has_many :destinations, through: :reviews

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.set_current_user(user)
    @@user = user
  end
  
  def self.current_user
    @@user
  end
end
