class Passenger < ActiveRecord::Base
  has_many :trips

  has_secure_password
  validates_confirmation_of :password, :message => "no-confirmation"
  after_validation :ensure_token

  def ensure_token
    self.token = generate_token
  end



  private
    def generate_token
      loop do
        token = SecureRandom.uuid
        break token unless Passenger.where(token:token).first
      end
    end


end
