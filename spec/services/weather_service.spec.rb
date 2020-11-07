require 'rails_helper'

RSpec.describe WeatherService do
  describe 'happy paths' do
    it 'can fetch the forecase given lat and long' do
      VCR.use_cassette('forecast_denver') do
        response = WeatherService.fetch_forecast(39.738453, -104.984853)
        expect(response).to be(successful)
        forecast_response_structure(response)
      end
    end
  end

  describe 'sad paths' do
    it 'no matching coordinates' do
    end

    it 'more than one match?' do
      # ex: Denver CO returns Denver city and Denver county
    end
  end
end