require 'rails_helper'

RSpec.describe 'Forecast Facade' do
  it 'returns an image poro when given a city' do
    VCR.use_cassette('image_sf') do
      image = ImageFacade.get_background('San Francisco, CA')

      expect(image).to be_an(Image)
      expect(image.description).to be_a(String).or eq(nil)
      expect(image.url).to be_a(String)
      expect(image.credits).to be_a(Hash)
      expect(image.credits[:artist_username]).to be_a(String)
      expect(image.credits[:artist_name]).to be_a(String)
      expect(image.credits[:profile_url]).to be_a(String)
    end
  end

  it 'returns no results when no matching photos found' do
    VCR.use_cassette('image_no_results') do
      image = ImageFacade.get_background('tfyhjkn')

      expect(image).to be_a(Hash)

      expect(image).to have_key(:total)
      expect(image[:total]).to eq(0)

      expect(image).to have_key(:total_pages)
      expect(image[:total_pages]).to eq(0)

      expect(image).to have_key(:results)
      expect(image[:results]).to eq([])
    end
  end
end
