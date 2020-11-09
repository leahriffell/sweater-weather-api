require 'rails_helper'

describe 'Login User API' do
  it 'can login an existing user' do
    user = User.create(email: 'user@example.com', password: 'password', api_key: '8f81a6b6-e370-441b-ac9c-97c3178ccfed')

    json_payload = {
      'email': 'user@example.com',
      'password': 'password',
    }

    headers = {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json'
    }

    post '/api/v1/sessions', headers: headers, params: json_payload.to_json

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    user_exposure_structure(parsed)
  end

  describe 'error handling' do
    it 'sends generic error message when user enters incorrect password' do
      user = User.create(email: 'whatever@example.com', password: 'password', api_key: '8f81a6b6-e370-441b-ac9c-97c3178ccfed')

      json_payload = {
        'email': 'whatever@example.com',
        'password': 'wrong'
      }

      headers = {
        'CONTENT_TYPE' => 'application/json',
        'ACCEPT' => 'application/json'
      }

      post '/api/v1/sessions', headers: headers, params: json_payload.to_json

      expect(response).to_not be_successful
      parsed = JSON.parse(response.body, symbolize_names: true)
      expect(parsed[:errors]).to eq('Incorrect email and/or password')
    end

    it 'sends generic error message when user enters email that does not exist in users table' do
      json_payload = {
        'email': 'whatever@example.com',
        'password': 'wrong'
      }

      headers = {
        'CONTENT_TYPE' => 'application/json',
        'ACCEPT' => 'application/json'
      }

      post '/api/v1/sessions', headers: headers, params: json_payload.to_json

      expect(response).to_not be_successful
      parsed = JSON.parse(response.body, symbolize_names: true)
      expect(parsed[:errors]).to eq('Incorrect email and/or password')
    end
  end
end