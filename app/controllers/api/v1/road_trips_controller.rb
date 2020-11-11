class Api::V1::RoadTripsController < ApplicationController
  def create
    trip_request = JSON.parse(request.raw_post, symbolize_names: true)
    if !trip_request[:api_key] || !authorized_user?(trip_request[:api_key])
      render json: {error: 'Unable to authenticate' } ,status: 401
    else
      render json: RoadTripDetailsSerializer.new(RoadTripFacade.new_trip(trip_request[:origin], trip_request[:destination], request[:user_key]))
    end
  end

  private

  def authorized_user?(user_key)
    User.exists?(api_key: user_key)
  end
end