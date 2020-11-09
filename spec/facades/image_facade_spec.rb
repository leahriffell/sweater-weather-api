require 'rails_helper'

RSpec.describe 'Forecast Facade' do
  it 'returns an image poro when given a city' do
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
