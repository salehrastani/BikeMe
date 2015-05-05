class Driver < ActiveRecord::Base
  has_many :trips
  has_many :vehicles

  has_secure_password

  # validates_confirmation_of :password, :message => "no-confirmation"

end
