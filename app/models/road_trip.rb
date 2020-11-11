class RoadTrip < ApplicationRecord
  belongs_to :user

  validates :start_city, presence: true
  validates :end_city, presence: true
  validates :travel_time, presence: true
end