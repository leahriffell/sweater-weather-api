require 'rails_helper'

RSpec.describe 'Road Trip Facade' do
  before :each do
    @user = User.create!(email: 'user@email.com', password: 'password', api_key: 'jgn983hy48thw9begh98h4539h4')
  end

  it 'returns a road trip details poro when given an origin and depature city' do
    VCR.use_cassette('route_denver_middlebury') do
      trip_details = RoadTripFacade.new_trip('Denver, CO', 'Middlebury, IN', @user.api_key)

      expect(trip_details).to be_a(RoadTripDetails)
      expect(trip_details.start_city).to eq('Denver, CO')
      expect(trip_details.end_city).to eq('Middlebury, IN')
      expect(trip_details.travel_time).to be_a(String)
      expect(trip_details.weather_at_eta).to be_a(Hash)
      expect(trip_details.weather_at_eta).to have_key(:temperature)
      expect(trip_details.weather_at_eta[:temperature]).to be_a(Numeric)
      expect(trip_details.weather_at_eta).to have_key(:conditions)
      expect(trip_details.weather_at_eta[:conditions]).to be_a(String)
    end
  end

  it 'returns a road trip details poro when given an impossible road trip scenario (ex: NYC > Tokyo)' do
    VCR.use_cassette('route_impossible_NYC_TKO') do
      trip_details = RoadTripFacade.new_trip('New York, New York', 'London, UK', @user.api_key)

      expect(trip_details).to be_a(RoadTripDetails)
      expect(trip_details.start_city).to eq('New York, New York')
      expect(trip_details.end_city).to eq('London, UK')
      expect(trip_details.travel_time).to eq('impossible')
      expect(trip_details.weather_at_eta).to be_a(Hash)
      expect(trip_details.weather_at_eta).to have_key(:temperature)
      expect(trip_details.weather_at_eta[:temperature]).to eq('')
      expect(trip_details.weather_at_eta).to have_key(:conditions)
      expect(trip_details.weather_at_eta[:conditions]).to eq('')
    end
  end

  it 'does not return a road trip details poro when given an incorrect api key' do
  end
end
