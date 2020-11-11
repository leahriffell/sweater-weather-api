require 'rails_helper'

RSpec.describe ImageService do
  describe 'happy paths' do
    it 'can fetch the lat and long for a city' do
      VCR.use_cassette('image_denver') do
        response = ImageService.fetch_image('Denver, CO')
        image_response_structure(response)
      end
    end
  end

  describe 'sad paths' do
    it 'returns no matching photo' do
      VCR.use_cassette('image_no_results') do
        response = ImageService.fetch_image('abcdefgh')
        expect(response).to be_a(Hash)

        expect(response).to have_key(:total)
        expect(response[:total]).to eq(0)

        expect(response).to have_key(:total_pages)
        expect(response[:total_pages]).to eq(0)

        expect(response).to have_key(:results)
        expect(response[:results]).to eq([])
      end
    end
  end
end
