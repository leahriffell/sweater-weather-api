require 'rails_helper'

describe 'Forecast API' do
  before :each do
    @headers = {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json'
    }
  end

  describe 'show forecast' do
    it 'can send the current weather for a specific city' do
      VCR.use_cassette('forecast_tokyo') do
        params = {
          'location' => 'tokyo,japan'
        }

        get '/api/v1/forecast?', headers: @headers, params: params

        expect(response).to be_successful
        parsed = JSON.parse(response.body, symbolize_names: true)
        forecast_exposure_structure(parsed)
      end
    end

    it 'filters out necessary info' do
      VCR.use_cassette('forecast_denver') do
        params = {
          'location' => 'denver,co'
        }

        get '/api/v1/forecast?', headers: @headers, params: params

        parsed = JSON.parse(response.body, symbolize_names: true) 
        forecast_exposure_excluded_fields(parsed)
      end
    end
  end
end