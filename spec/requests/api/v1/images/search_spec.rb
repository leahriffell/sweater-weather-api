require 'rails_helper'

describe 'Image API' do
  before :each do
    @headers = {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json'
    }
  end

  describe 'search for background image' do
    it 'can send a background image given a location' do
      VCR.use_cassette('image_denver') do
        params = {
          'location' => 'denver,co'
        }

        get '/api/v1/backgrounds?', headers: @headers, params: params

        expect(response).to be_successful
        parsed = JSON.parse(response.body, symbolize_names: true) 
        image_exposure_structure(parsed)
      end
    end

    it 'filters out necessary info' do
      VCR.use_cassette('image_nyc') do
        params = {
          'location' => 'New York, New York'
        }

        get '/api/v1/backgrounds?', headers: @headers, params: params

        parsed = JSON.parse(response.body, symbolize_names: true) 
        image_exposure_excluded_fields(parsed)
      end
    end
  end
end