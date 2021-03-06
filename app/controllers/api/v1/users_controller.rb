class Api::V1::UsersController < ApplicationController
  def create
    user_details = JSON.parse(request.raw_post, symbolize_names: true)
    user = UserFacade.register(user_details)
    if user.save
      render json: UserSerializer.new(user), status: 201
    else
      render json: {errors: user.errors.full_messages.to_sentence}, status: 400
    end
  end

  def login
    user_details = JSON.parse(request.raw_post, symbolize_names: true)
    user = UserFacade.find_by_email(user_details[:email])
    if user && user.authenticate(user_details[:password])
      render json: UserSerializer.new(user), status: 200
    else
      render json: {errors: 'Incorrect email and/or password'}, status: 400
    end
  end
end