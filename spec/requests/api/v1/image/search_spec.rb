require 'rails_helper'

describe 'Image API' do
  describe 'search for background image' do
    it 'can send a background image given a location' do
      params = {
        'location' => 'denver,co'
      }

      headers = {
        'CONTENT_TYPE' => 'application/json',
        'ACCEPT' => 'application/json'
      }

      get '/api/v1/backgrounds?', headers: headers, params: params

      expect(response).to be_successful
      parsed = JSON.parse(response.body, symbolize_names: true) 
      image_exposure_structure(parsed)

      params = {
        'location' => 'New York, New York'
      }

      headers = {
        'CONTENT_TYPE' => 'application/json',
        'ACCEPT' => 'application/json'
      }

      get '/api/v1/backgrounds?', headers: headers, params: params

      expect(response).to be_successful
      parsed = JSON.parse(response.body, symbolize_names: true) 
      image_exposure_structure(parsed)
    end

    it 'filters out necessary info' do
      params = {
        'location' => 'New York, New York'
      }

      headers = {
        'CONTENT_TYPE' => 'application/json',
        'ACCEPT' => 'application/json'
      }

      get '/api/v1/backgrounds?', headers: headers, params: params

      parsed = JSON.parse(response.body, symbolize_names: true) 
      image_exposure_excluded_fields(parsed)
    end
  end
end