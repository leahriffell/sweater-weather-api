require 'rails_helper'

RSpec.describe ImageService do
  describe 'happy paths' do
    it 'can fetch the lat and long for a city' do
      # VCR.use_cassette('image_denver') do
        response = ImageService.fetch_image('Denver, CO')
        image_response_structure(response)
      # end
    end
  end

  describe 'sad paths' do
    it 'returns no matching photo' do
    end
  end
end
