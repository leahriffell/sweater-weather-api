require 'rails_helper'

RSpec.describe 'Trail Search Details poro' do
  it 'exists' do
    VCR.use_cassette('trail_search_details_nyc') do
      location = 'New York, NY'
      search_details = TrailSearchDetails.new(location)

      expect(search_details).to be_a(TrailSearchDetails)

      expect(search_details.forecast).to be_a(Hash)

      expect(search_details.forecast).to have_key(:summary)
      expect(search_details.forecast[:summary]).to be_a(String)

      expect(search_details.forecast).to have_key(:temperature)
      expect(search_details.forecast[:temperature]).to be_a(Numeric)

      expect(search_details.location).to eq(location)

      expect(search_details.trails).to be_an(Array)

      search_details.trails.each do |trail|
        expect(trail).to be_a(Trail)
      end
    end
  end
end