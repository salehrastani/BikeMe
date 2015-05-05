class Passenger < ActiveRecord::Base
  has_many :trips

  has_secure_password

  # validates_confirmation_of :password, :message => "no-confirmation"

end
