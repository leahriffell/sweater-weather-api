require 'rails_helper'

RSpec.describe GeocodeService do
  describe 'happy paths' do
    it 'can fetch the lat and long for a city' do
      VCR.use_cassette('geocode_denver') do
        response = GeocodeService.forward_geocode('Denver, CO')
        expect(response).to have_key(:lat)
        expect(response[:lat]).to be_a(Float)
        expect(response).to have_key(:lng)
        expect(response[:lng]).to be_a(Float)
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