class Driver < ActiveRecord::Base
  has_many :trips
  has_many :vehicles

  has_secure_password

  validates_confirmation_of :password, :message => "no-confirmation"

  include BCrypt

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

end
