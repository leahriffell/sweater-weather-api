require 'rails_helper'

RSpec.describe MapService do
  describe 'happy paths' do
    it 'can fetch the lat and long for a city' do
      VCR.use_cassette('geocode_denver') do
        response = MapService.forward_geocode('Denver, CO')
        expect(response).to have_key(:lat)
        expect(response[:lat]).to be_a(Numeric)
        expect(response).to have_key(:lng)
        expect(response[:lng]).to be_a(Numeric)
      end
    end

    it 'can get distance between two lat and long points' do
      VCR.use_cassette('distance_denver_to_roxborough_park') do
        response = MapService.distance_between(39.738453, -104.984853, 39.487, -105.0908)
        expect(response).to be_a(Float)
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