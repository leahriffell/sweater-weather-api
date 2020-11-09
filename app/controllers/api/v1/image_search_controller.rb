class Api::V1::ImageSearchController < ApplicationController
  def show
    render json: ImageSerializer.new(ImageFacade.get_background(params[:location]))
  end
end