require 'rails_helper'

RSpec.describe 'Trails Facade' do
  it 'returns trail objects that are near a location' do
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