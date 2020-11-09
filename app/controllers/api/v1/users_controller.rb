class Api::V1::UsersController < ApplicationController
  def create
    user_details = JSON.parse(request.raw_post, symbolize_names: true)
    user = User.create(user_details)
    if user.save
      user.generate_api_key
      render json: UserSerializer.new(user), status: 201
    else
      render json: {errors: user.errors.full_messages.to_sentence}, status: 400
    end
  end
end