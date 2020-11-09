require 'rails_helper'

RSpec.describe TrailsService do
  describe 'happy paths' do
    it 'can fetch nearby trails given lat and lon' do
      VCR.use_cassette('search_trails_denver') do
        response = TrailsService.search_nearby_trails(39.738453, -104.984853)
        trails_response_structure(response)
      end
    end
  end

  describe 'sad paths' do
    it 'no matching trails' do
    end
  end
end
