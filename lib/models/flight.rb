class Flight < ActiveRecord::Base
  has_many :destinations
  has_many :cities
  belongs_to :departing_city, :class_name => "City", :foreign_key => "departing_city_id"
  belongs_to :arriving_city, :class_name => "City", :foreign_key => "arriving_city_id"

  def initialize(*args)

  end
end
