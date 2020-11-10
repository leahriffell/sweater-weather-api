require 'rails_helper'

describe 'Forecast API' do
  describe 'show forecast' do
    it 'can send the current weather for a specific city' do
      params = {
        'location' => 'denver,co'
      }

      headers = {
        'CONTENT_TYPE' => 'application/json',
        'ACCEPT' => 'application/json'
      }

      get '/api/v1/forecast?', headers: headers, params: params

      expect(response).to be_successful
      parsed = JSON.parse(response.body, symbolize_names: true) 
      forecast_exposure_structure(parsed)

      params = {
        'location' => 'Bloomington, IN'
      }

      headers = {
        'CONTENT_TYPE' => 'application/json',
        'ACCEPT' => 'application/json'
      }

      get '/api/v1/forecast?', headers: headers, params: params

      expect(response).to be_successful
      parsed = JSON.parse(response.body, symbolize_names: true) 
      forecast_exposure_structure(parsed)


      params = {
        'location' => 'New York, ny'
      }

      headers = {
        'CONTENT_TYPE' => 'application/json',
        'ACCEPT' => 'application/json'
      }

      get '/api/v1/forecast?', headers: headers, params: params

      expect(response).to be_successful
      parsed = JSON.parse(response.body, symbolize_names: true) 
      forecast_exposure_structure(parsed)
    end

    it 'filters out necessary info' do
      params = {
        'location' => 'denver,co'
      }

      headers = {
        'CONTENT_TYPE' => 'application/json',
        'ACCEPT' => 'application/json'
      }

      get '/api/v1/forecast?', headers: headers, params: params

      parsed = JSON.parse(response.body, symbolize_names: true) 
      forecast_exposure_excluded_fields(parsed)
    end
  end
end