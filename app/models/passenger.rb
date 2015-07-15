class Passenger < ActiveRecord::Base
  has_many :trips

  has_secure_password
  validates_confirmation_of :password, :message => "no-confirmation"
  after_validation :ensure_token

  def ensure_token
    self.token = generate_token
  end

  def to_json(options={})
    options[:except] ||= [:password_digest, :token]
    super(options)
  end

  private
    def generate_token
      loop do
        token = SecureRandom.uuid
        break token unless Passenger.where(token:token).first
      end
    end


end
