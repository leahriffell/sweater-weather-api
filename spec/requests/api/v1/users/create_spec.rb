require 'rails_helper'

describe 'New User API' do
  it 'can register a new user' do
    json_payload = {
      'email': 'whatever@example.com',
      'password': 'password',
      'password_confirmation': 'password'
    }

    headers = {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json'
    }

    post '/api/v1/users', headers: headers, params: json_payload.to_json

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    new_user_exposure_structure(parsed)
  end

  # it 'receives an '
end