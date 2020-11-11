require 'rails_helper'


RSpec.describe 'Road Trip Details poro' do
  it 'exists' do 
    user = User.create!(email: 'user@email.com', password: 'password')

    trip = RoadTrip.create!(start_city: 'Denver,CO', end_city: 'Middlebury,IN', travel_time: '16:08:29', user: user)
    
    weather = {
              :dt=>1605106800,
              :temp=>43.03,
              :feels_like=>32.92,
              :pressure=>1016,
              :humidity=>67,
              :dew_point=>32.9,
              :clouds=>33,
              :visibility=>10000,
              :wind_speed=>11.83,
              :wind_deg=>296,
              :weather=>[{:id=>802, :main=>"Clouds", :description=>"scattered clouds", :icon=>"03d"}],
              :pop=>0
            }
              
    road_trip = RoadTripDetails.new(trip, weather)

    expect(road_trip).to be_a(RoadTripDetails)

    expect(road_trip.start_city).to eq(trip.start_city)
    expect(road_trip.end_city).to eq(trip.end_city)
    expect(road_trip.travel_time).to eq(trip.travel_time)

    expect(road_trip.weather_at_eta).to be_a(Hash)

    expect(road_trip.weather_at_eta[:temperature]).to eq(weather[:temp])
    expect(road_trip.weather_at_eta[:conditions]).to eq(weather[:weather][0][:description])
  end

  it 'can be created with undetermined weather at ETA' do 
    user = User.create!(email: 'user@email.com', password: 'password')

    trip = RoadTrip.create!(start_city: 'Toronto, Canada', end_city: 'San Salvador, El Salvador', travel_time: '57:50:37', user: user)
    
    weather =  { 
                temp: 'ETA is too far out to receive forecast', 
                weather: [{ description: 'ETA is too far out to receive forecast' }]
                }
                 
    road_trip = RoadTripDetails.new(trip, weather)

    expect(road_trip).to be_a(RoadTripDetails)

    expect(road_trip.start_city).to eq(trip.start_city)
    expect(road_trip.end_city).to eq(trip.end_city)
    expect(road_trip.travel_time).to eq(trip.travel_time)

    expect(road_trip.weather_at_eta).to be_a(Hash)

    expect(road_trip.weather_at_eta[:temperature]).to eq(weather[:temp])
    expect(road_trip.weather_at_eta[:conditions]).to eq(weather[:weather][0][:description])
  end
end