class Passenger < ActiveRecord::Base
  has_many :trips

  has_secure_password
  validates_confirmation_of :password, :message => "no-confirmation"

  # include BCrypt

  # def password
  #   @password ||= Password.new(password_hash)
  # end

  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end

end
