class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :destination

  def initialize(*args)

  end
end
