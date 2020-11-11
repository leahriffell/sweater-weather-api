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

    it 'can fetch the trip duration for a road trip' do
      VCR.use_cassette('route_long_distance_TO_SV') do
        response = MapService.fetch_trip_duration('Denver, CO', 'Middlebury, IN')
        expect(response).to be_a(Hash)
        expect(response).to have_key(:duration)
        expect(response[:duration]).to be_a(String)
        expect(response[:duration].include?(':'))
      end
    end

    it 'can fetch the destination lat and long from route endpoint' do
      VCR.use_cassette('route_denver_middlebury') do
        response = MapService.fetch_trip_duration('Denver, CO', 'Middlebury, IN')
        expect(response[:end_lat_lng]).to be_a(Hash)
        expect(response[:end_lat_lng]).to have_key(:lat)
        expect(response[:end_lat_lng]).to have_key(:lng)
        expect(response[:end_lat_lng][:lat]).to be_a(Numeric)
        expect(response[:end_lat_lng][:lng]).to be_a(Numeric)
      end
    end
  end

  describe 'sad paths' do
    describe 'forward_geocode' do
      it 'no matching coordinates' do
        VCR.use_cassette('geocode_no_match') do
          response = MapService.forward_geocode('abcdefghijklmnop')

          expect(response).to be_a(Hash)
          expect(response).to have_key(:lat)
          expect(response).to have_key(:lng)
          expect(response[:lat]).to eq('no match')
          expect(response[:lng]).to eq('no match')
        end
      end
    end

    describe 'fetch_trip_duration' do
      it "returns 'impossible' if roadtrip is not possible" do
        VCR.use_cassette('route_impossible_NYC_TKO') do
          response = MapService.fetch_trip_duration('New York, NY', 'Tokyo, Japan')
          expect(response[:duration]).to eq('impossible')
          expect(response[:end_lat_lng]).to eq(nil)
        end
      end

      it 'no matching cities' do
        VCR.use_cassette('route_no_match_cities') do
          response = MapService.fetch_trip_duration('abcd', 'efgh')
          expect(response[:duration]).to eq('impossible')
          expect(response[:end_lat_lng]).to eq(nil)
        end
      end
    end
  end
end