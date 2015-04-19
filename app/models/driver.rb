class Driver < ActiveRecord::Base
  has_many :trips
  has_many :vehicles

end
