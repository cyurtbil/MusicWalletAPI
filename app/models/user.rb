class User < ActiveRecord::Base
  has_many :wallets
  has_one :authentication
  validates :username, uniqueness: true, on: :create

  has_secure_password

  before_create :set_token

  private

    def set_token
      return if token.present?
      self.token = generate_token
    end

    def generate_token
      SecureRandom.uuid.gsub(/\-/, '')
    end
end