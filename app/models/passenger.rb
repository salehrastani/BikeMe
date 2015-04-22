class Passenger < ActiveRecord::Base
  has_many :trips

  validates_confirmation_of :password, :message => "no-confirmation"

end
