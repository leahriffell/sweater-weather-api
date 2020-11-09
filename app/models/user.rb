class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates :password, presence: true

  def generate_api_key
    update(api_key: SecureRandom.uuid)
  end
end