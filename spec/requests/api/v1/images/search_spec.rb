require 'rails_helper'

describe 'Image API' do
  before :each do
    @headers = {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json'
    }
  end

  describe 'search for background image' do
    it 'can send a background image given a location' do
      VCR.use_cassette('image_denver') do
        params = {
          'location' => 'denver,co'
        }

        get '/api/v1/backgrounds?', headers: @headers, params: params

        expect(response).to be_successful
        parsed = JSON.parse(response.body, symbolize_names: true)
        image_exposure_structure(parsed)
      end
    end

    it 'filters out necessary info' do
      VCR.use_cassette('image_nyc') do
        params = {
          'location' => 'New York, New York'
        }

        get '/api/v1/backgrounds?', headers: @headers, params: params

        parsed = JSON.parse(response.body, symbolize_names: true) 
        image_exposure_excluded_fields(parsed)
      end
    end

    # it 'can return no matching photos' do
    #   VCR.use_cassette('image_no_results') do
    #     params = {
    #       'location' => 'tfyhjkn'
    #     }

    #     get '/api/v1/backgrounds?', headers: @headers, params: params

    #     parsed = JSON.parse(response.body, symbolize_names: true) 
    #     expect(parsed).to be_a(Hash)

    #     expect(parsed).to have_key(:total)
    #     expect(parsed[:total]).to eq(0)

    #     expect(parsed).to have_key(:total_pages)
    #     expect(parsed[:total_pages]).to eq(0)

    #     expect(parsed).to have_key(:results)
    #     expect(parsed[:results]).to eq([])
    #   end
    # end
  end
end