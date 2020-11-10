require 'rails_helper'

describe 'New Roadtrip API' do
  before :each do
    @user = User.create!(email: 'user@email.com', password: 'password', api_key: 'jgn983hy48thw9begh98h4539h4')
  end

  it 'can create a new roadtrip and send back duration and weather conditions at ETA' do
    json_payload = {
      'origin': 'Denver,CO',
      'destination': 'Middlebury,IN',
      'api_key': 'jgn983hy48thw9begh98h4539h4'
    }

    headers = {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json'
    }

    post '/api/v1/road_trip', headers: headers, params: json_payload.to_json

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    roadtrip_exposure_structure(parsed)

    json_payload = {
      'origin': 'Denver,CO',
      'destination': 'Larkspur,CO',
      'api_key': 'jgn983hy48thw9begh98h4539h4'
    }

    headers = {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json'
    }

    post '/api/v1/road_trip', headers: headers, params: json_payload.to_json

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    roadtrip_exposure_structure(parsed)
  end

  describe 'error handling' do
    it 'can return 401 (unauthorized) if request is sent without an API key' do
      #test
    end

    it 'can return 401 (unauthorized) if request is sent with incorrect API key' do
      #test
    end

    it "can return 'impossible' for travel time and no weather if impossible roadtrip is posted (ex: NYC > London)" do
      #test
    end

    it "can return 'impossible' for trip without matching cities" do
      #test
    end

    it 'sends a message if forecast is too far out to predict (ex: Toronto > San Salvador' do
      json_payload = {
        'origin': 'Toronto, Canada',
        'destination': 'San Salvador, El Salvador',
        'api_key': 'jgn983hy48thw9begh98h4539h4'
      }
  
      headers = {
        'CONTENT_TYPE' => 'application/json',
        'ACCEPT' => 'application/json'
      }
  
      post '/api/v1/road_trip', headers: headers, params: json_payload.to_json
  
      expect(response).to be_successful
      parsed = JSON.parse(response.body, symbolize_names: true)
      roadtrip_exposure_structure(parsed)
    end
  end
end
