require 'rails_helper'

describe 'Trails API' do
  describe 'search index trails' do
    it 'can send trails near a search point' do
      VCR.use_cassette('geocode_denver') do
        params = {
          'location' => 'Denver, CO'
        }

        headers = {
          'CONTENT_TYPE' => 'application/json',
          'ACCEPT' => 'application/json'
        }

        get '/api/v1/trails?', headers: headers, params: params

        expect(response).to be_successful
        parsed = JSON.parse(response.body, symbolize_names: true) 
        trails_exposure_structure(parsed)
      end
    end

    # it 'filters out necessary info' do
      # params = {
      #   'location' => 'denver,co'
      # }

      # headers = {
      #   'CONTENT_TYPE' => 'application/json',
      #   'ACCEPT' => 'application/json'
      # }

      # get '/api/v1/forecast?location=denver,co', headers: headers, params: params

      # parsed = JSON.parse(response.body, symbolize_names: true) 
      # forecast_exposure_excluded_fields(parsed)
    # end
  end
end