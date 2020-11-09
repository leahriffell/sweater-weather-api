class Api::V1::TrailSearchController < ApplicationController
  def index
    # render json: TrailsSerializer.new(ForecastFacade.forecast(params[:location]))

    current_weather = ForecastFacade.forecast(params[:location]).current_weather
    trails = TrailsFacade.nearby_trails(params[:location])

    render json: TrailSearchSerializer.new(TrailSearchDetails.new(params[:location], current_weather, trails))
  end
end