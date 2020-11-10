require 'rails_helper'

RSpec.describe WeatherService do
  describe 'happy paths' do
    it 'can fetch the forecast given lat and long' do
      # VCR.use_cassette('forecast_denver') do
        response = WeatherService.fetch_forecast(39.738453, -104.984853)
        forecast_response_structure(response)
      # end
    end

    it 'can fetch the forecast at a given point in future when given the lat, long, and time period' do
      response = WeatherService.future_forecast(39.738453, -104.984853, '00:41:20')
      expect(response).to be_a(Hash)

      expect(response).to have_key(:temp)
      expect(response[:temp]).to be_a(Numeric)

      expect(response).to have_key(:weather)
      expect(response[:weather]).to be_an(Array)

      expect(response[:weather][0]).to be_a(Hash)

      expect(response[:weather][0]).to have_key(:description)
      expect(response[:weather][0][:description]).to be_a(String)
    end
  end

  describe 'sad paths' do
    it 'no matching coordinates' do
    end

    it 'more than one match?' do
      # ex: Denver CO returns Denver city and Denver county
    end

    it 'sends a message if forecast is too far out to predict (ex: Toronto > San Salvador' do
      response = WeatherService.future_forecast(13.6929, 89.2182, '57:50:37')

      expect(response).to be_a(Hash)

      expect(response).to have_key(:temp)
      expect(response[:temp]).to be_a(String)

      expect(response).to have_key(:weather)
      expect(response[:weather]).to be_an(Array)

      expect(response[:weather][0]).to be_a(Hash)

      expect(response[:weather][0]).to have_key(:description)
      expect(response[:weather][0][:description]).to be_a(String)
    end
  end
end