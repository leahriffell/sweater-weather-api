require 'rails_helper'

RSpec.describe GeocodeService do
  describe 'happy paths' do
    it 'can fetch the lat and long for a city' do
      VCR.use_cassette('geocode_denver') do
        response = GeocodeService.forward_geocode('Denver, CO')
        expect(response).to be(successful)
        forward_geolocation_response_structure(response)
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