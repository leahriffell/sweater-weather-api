class Api::V1::RoadTripsController < ApplicationController
  def create
    trip_request = JSON.parse(request.raw_post, symbolize_names: true)
    render json: RoadTripDetailsSerializer.new(RoadTripFacade.new_trip(trip_request[:origin], trip_request[:destination], request[:user_key]))
  end

  # def login
  #   user_details = JSON.parse(request.raw_post, symbolize_names: true)
  #   user = User.find_by(email: user_details[:email])
  #   if user && user.authenticate(user_details[:password])
  #     render json: UserSerializer.new(user), status: 200
  #   else
  #     render json: {errors: 'Incorrect email and/or password'}, status: 400
  #   end
  # end
end