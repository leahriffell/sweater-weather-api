class Api::V1::ForecastController < ApplicationController
  def show
    ForecastFacade.forecast(params[:location])
  end
end