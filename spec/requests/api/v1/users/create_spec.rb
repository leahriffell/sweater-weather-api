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
    user_exposure_structure(parsed)
  end

  it 'sends an error message if user signs up with conflicting passwords' do
    json_payload = {
      'email': 'whatever@example.com',
      'password': 'password',
      'password_confirmation': 'wrong'
    }

    headers = {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json'
    }

    post '/api/v1/users', headers: headers, params: json_payload.to_json
    expect(response).to_not be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:errors]).to eq("Password confirmation doesn't match Password")
  end

  it 'sends an error message if user signs up with an email that already exists' do
    User.create(email: 'test@email.com', password: 'word')

    json_payload = {
      'email': 'test@email.com',
      'password': 'password',
      'password_confirmation': 'password'
    }

    headers = {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json'
    }

    post '/api/v1/users', headers: headers, params: json_payload.to_json
    expect(response).to_not be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:errors]).to eq('Email has already been taken')
  end

  it 'sends an error message if user signs up with an email that already exists and submits mismatched password confirmation' do
    User.create(email: 'test@email.com', password: 'word')

    json_payload = {
      'email': 'test@email.com',
      'password': 'password',
      'password_confirmation': 'wrong'
    }

    headers = {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json'
    }

    post '/api/v1/users', headers: headers, params: json_payload.to_json
    expect(response).to_not be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:errors]).to eq("Password confirmation doesn't match Password and Email has already been taken")
  end
end