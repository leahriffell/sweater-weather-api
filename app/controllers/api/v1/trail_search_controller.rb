class Api::V1::TrailSearchController < ApplicationController
  def index
    render json: TrailSearchSerializer.new(TrailsFacade.weather_and_trails(params[:location]))
  end
end