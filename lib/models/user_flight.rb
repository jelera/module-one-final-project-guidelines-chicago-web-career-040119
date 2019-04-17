class UserFlight < ActiveRecord::Base
  belongs_to :user
  belongs_to :flight

  def initialize(*args)

  end
end
