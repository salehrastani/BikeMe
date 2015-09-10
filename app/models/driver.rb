class Driver < ActiveRecord::Base
  has_many :trips
  has_many :vehicles
  has_many :ratings, as: :ratable
  has_many :locations, as: :locatable

  has_secure_password
  validates_confirmation_of :password, :message => "no-confirmation"
  after_validation :ensure_token

  def ensure_token
    self.token = generate_token
  end

  def to_json(options={})
    options[:except] ||= [:password_digest]
    super(options)
  end

  private
    def generate_token
      loop do
        token = SecureRandom.uuid
        break token unless Driver.where(token:token).first
      end
    end

end

