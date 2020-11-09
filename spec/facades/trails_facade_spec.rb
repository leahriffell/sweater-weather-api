require 'rails_helper'

RSpec.describe 'Trails Facade' do
  it 'returns trail search detail object for a location' do 
    VCR.use_cassette('geocode_nyc') do
      search_results = TrailsFacade.weather_and_trails('New York, NY')
      expect(search_results).to be_a(TrailSearchDetails)
    end
  end

  it 'returns trail objects that are near a location' do
    VCR.use_cassette('geocode_and_search_trails_denver') do
      trails = TrailsFacade.nearby_trails('Denver, CO')

      expect(trails).to be_an(Array)

      trails.each do |trail|
        expect(trail).to be_a(Trail)
        expect(trail.name).to be_a(String)
        expect(trail.summary).to be_a(String)
        expect(trail.difficulty).to be_a(String)
        expect(trail.location).to be_a(String)
        expect(trail.distance_to_trail).to be_a(Numeric)
      end
    end
  end
end