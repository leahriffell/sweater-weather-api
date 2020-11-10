class User < ApplicationRecord
  has_secure_password
  has_secure_token :api_key
  has_many :road_trips

  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
end