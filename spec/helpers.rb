module Helpers
  # ----- API consumption helper methods -----
  def forward_geolocation_response_structure(response)
    expect(response).to be_a(Hash)
    expect(response).to have_key(:results)
    
    expect(response[:results]).to be_an(Array)

    expect(response[:results][0]).to have_key(:locations)
    expect(response[:results][0][:locations]).to be_an(Array)

    expect(response[:results][0][:locations][0]).to be_a(Hash)

    expect(response[:results][0][:locations][0]).to have_key(:latLng)
    expect(response[:results][0][:locations][0][:latLng]).to be_a(Hash)

    expect(response[:results][0][:locations][0][:latLng]).to have_key(:lat)
    expect(response[:results][0][:locations][0][:latLng]).to have_key(:lng)

    expect(response[:results][0][:locations][0][:latLng][:lat]).to be_an(Numeric)
    expect(response[:results][0][:locations][0][:latLng][:lng]).to be_an(Numeric)
  end

  def forecast_response_structure(response)
    expect(response).to be_a(Hash)

    expect(response).to have_key(:current)

    expect(response[:current]).to have_key(:dt)
    expect(response[:current][:dt]).to be_an(Integer)

    expect(response[:current]).to have_key(:sunrise)
    expect(response[:current][:sunrise]).to be_an(Integer)
    
    expect(response[:current]).to have_key(:sunset)
    expect(response[:current][:sunset]).to be_an(Integer)

    expect(response[:current]).to have_key(:temp)
    expect(response[:current][:temp]).to be_a(Numeric)

    expect(response[:current]).to have_key(:feels_like)
    expect(response[:current][:feels_like]).to be_a(Numeric)

    expect(response[:current]).to have_key(:humidity)
    expect(response[:current][:humidity]).to be_a(Numeric)

    expect(response[:current]).to have_key(:uvi)
    expect(response[:current][:uvi]).to be_a(Numeric)

    expect(response[:current]).to have_key(:visibility)
    expect(response[:current][:visibility]).to be_a(Numeric)

    expect(response[:current]).to have_key(:weather)
    expect(response[:current][:weather]).to be_an(Array)

    expect(response[:current][:weather][0]).to have_key(:description)
    expect(response[:current][:weather][0][:description]).to be_a(String)

    expect(response[:current][:weather][0]).to have_key(:icon)
    expect(response[:current][:weather][0][:icon]).to be_a(String)

    expect(response).to have_key(:daily)
    expect(response[:daily]).to be_an(Array)
    expect(response[:daily][0..4].count).to eq(5)

    response[:daily][0..4].each do |daily|
      expect(daily).to have_key(:dt)
      expect(daily[:dt]).to be_an(Integer)

      expect(daily).to have_key(:sunrise)
      expect(daily[:sunrise]).to be_an(Integer)

      expect(daily).to have_key(:sunset)
      expect(daily[:sunset]).to be_an(Integer)

      expect(daily).to have_key(:temp)
      expect(daily[:temp]).to be_a(Hash)

      expect(daily[:temp]).to have_key(:max)
      expect(daily[:temp][:max]).to be_a(Numeric)

      expect(daily[:temp]).to have_key(:min)
      expect(daily[:temp][:min]).to be_a(Numeric)

      expect(daily).to have_key(:weather)
      expect(daily[:weather]).to be_an(Array)

      expect(daily[:weather][0]).to have_key(:description)
      expect(daily[:weather][0][:description]).to be_a(String)

      expect(daily[:weather][0]).to have_key(:icon)
      expect(daily[:weather][0][:icon]).to be_a(String)
    end

    response[:hourly][0..7].each do |hourly|
      expect(hourly).to be_a(Hash)

      expect(hourly).to have_key(:dt)
      expect(hourly[:dt]).to be_an(Integer)

      expect(hourly).to have_key(:wind_speed)
      expect(hourly[:wind_speed]).to be_a(Numeric)

      expect(hourly).to have_key(:wind_deg)
      expect(hourly[:wind_deg]).to be_an(Integer)

      expect(hourly).to have_key(:weather)
      expect(hourly[:weather]).to be_an(Array)

      expect(hourly[:weather][0]).to have_key(:description)
      expect(hourly[:weather][0][:description]).to be_a(String)

      expect(hourly[:weather][0]).to have_key(:icon)
      expect(hourly[:weather][0][:icon]).to be_a(String)
    end
  end

  def image_response_structure(response)
    expect(response[:results]).to be_an(Array)
    expect(response[:results].count).to eq(1)

    first_result = response[:results][0]
    expect(first_result).to be_a(Hash)

    expect(first_result).to have_key(:description)
    expect(first_result[:description]).to be_a(String)

    expect(first_result).to have_key(:urls)
    expect(first_result[:urls]).to be_a(Hash)

    expect(first_result[:urls]).to have_key(:regular)
    expect(first_result[:urls][:regular]).to be_a(String)

    expect(first_result).to have_key(:user)
    expect(first_result[:user]).to be_a(Hash)

    expect(first_result[:user]).to have_key(:username)
    expect(first_result[:user][:username]).to be_a(String)

    expect(first_result[:user]).to have_key(:name)
    expect(first_result[:user][:name]).to be_a(String)

    expect(first_result[:user]).to have_key(:links)
    expect(first_result[:user][:links]).to be_a(Hash)

    expect(first_result[:user][:links]).to have_key(:html)
    expect(first_result[:user][:links][:html]).to be_a(String)
  end

  # ----- API exposure helper methods -----

  def forecast_exposure_structure(parsed)
    expect(parsed).to have_key(:data)
    expect(parsed[:data]).to be_a(Hash)

    data = parsed[:data]

    expect(data).to have_key(:id)
    expect(data[:id]).to eq(nil)

    expect(data).to have_key(:type)
    expect(data[:type]).to eq('forecast')

    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to be_a(Hash)
    
    # ----- current weather hash -----
    expect(data[:attributes]).to have_key(:current_weather)
    expect(data[:attributes][:current_weather]).to be_a(Hash)

    expect(data[:attributes][:current_weather]).to have_key(:datetime)
    expect(data[:attributes][:current_weather][:datetime]).to be_a(String)

    expect(data[:attributes][:current_weather]).to have_key(:sunrise)
    expect(data[:attributes][:current_weather][:sunrise]).to be_a(String)

    expect(data[:attributes][:current_weather]).to have_key(:sunset)
    expect(data[:attributes][:current_weather][:sunset]).to be_a(String)

    expect(data[:attributes][:current_weather]).to have_key(:temperature)
    expect(data[:attributes][:current_weather][:temperature]).to be_a(Numeric)

    expect(data[:attributes][:current_weather]).to have_key(:feels_like)
    expect(data[:attributes][:current_weather][:feels_like]).to be_a(Numeric)

    expect(data[:attributes][:current_weather]).to have_key(:humidity)
    expect(data[:attributes][:current_weather][:humidity]).to be_a(Numeric)

    expect(data[:attributes][:current_weather]).to have_key(:uvi)
    expect(data[:attributes][:current_weather][:uvi]).to be_a(Numeric)

    expect(data[:attributes][:current_weather]).to have_key(:visibility)
    expect(data[:attributes][:current_weather][:visibility]).to be_a(Numeric)

    expect(data[:attributes][:current_weather]).to have_key(:conditions)
    expect(data[:attributes][:current_weather][:conditions]).to be_a(String)

    expect(data[:attributes][:current_weather]).to have_key(:icon)
    expect(data[:attributes][:current_weather][:icon]).to be_a(String)

    # ----- daily weather hash -----
    expect(data[:attributes]).to have_key(:daily_weather)
    expect(data[:attributes][:daily_weather]).to be_an(Array)

    expect(data[:attributes][:daily_weather].count).to eq(5)

    data[:attributes][:daily_weather].each do |daily|
      expect(daily).to be_a(Hash)

      expect(daily).to have_key(:date)
      expect(daily[:date]).to be_a(String)
      
      expect(daily).to have_key(:sunrise)
      expect(daily[:sunrise]).to be_a(String)

      expect(daily).to have_key(:sunset)
      expect(daily[:sunset]).to be_a(String)

      expect(daily).to have_key(:max_temp)
      expect(daily[:max_temp]).to be_a(Numeric)

      expect(daily).to have_key(:min_temp)
      expect(daily[:min_temp]).to be_a(Numeric)

      expect(daily).to have_key(:conditions)
      expect(daily[:conditions]).to be_a(String)

      expect(daily).to have_key(:icon)
      expect(daily[:icon]).to be_a(String)
    end

    # ----- hourly weather hash -----
    expect(data[:attributes]).to have_key(:hourly_weather)
    expect(data[:attributes][:hourly_weather]).to be_an(Array)

    expect(data[:attributes][:hourly_weather].count).to eq(8)

    data[:attributes][:hourly_weather].each do |hourly|
      expect(hourly).to be_a(Hash)

      expect(hourly).to have_key(:time)
      expect(hourly[:time]).to be_a(String)

      expect(hourly).to have_key(:temperature)
      expect(hourly[:temperature]).to be_a(Numeric)
      
      expect(hourly).to have_key(:wind_speed)
      expect(hourly[:wind_speed]).to be_a(String)

      expect(hourly).to have_key(:wind_direction)
      expect(hourly[:wind_direction]).to be_a(String)

      expect(hourly).to have_key(:conditions)
      expect(hourly[:conditions]).to be_a(String)

      expect(hourly).to have_key(:icon)
      expect(hourly[:icon]).to be_a(String)
    end
  end

  def forecast_exposure_excluded_fields(parsed)
    details = parsed[:data][:attributes]
    expect(details).to_not have_key(:lat)
    expect(details).to_not have_key(:lon)
    expect(details).to_not have_key(:timezone)
    expect(details).to_not have_key(:timezone_offset)
    expect(details).to_not have_key(:minutely)

    expect(details[:current_weather]).to_not have_key(:pressure)
    expect(details[:current_weather]).to_not have_key(:dew_point)
    expect(details[:current_weather]).to_not have_key(:clouds)
    expect(details[:current_weather]).to_not have_key(:wind_gust)
    expect(details[:current_weather]).to_not have_key(:weather)

    expect(details[:hourly_weather][0]).to_not have_key(:feels_like)
    expect(details[:hourly_weather][0]).to_not have_key(:pressure)
    expect(details[:hourly_weather][0]).to_not have_key(:humidity)
    expect(details[:hourly_weather][0]).to_not have_key(:dew_point)
    expect(details[:hourly_weather][0]).to_not have_key(:clouds)
    expect(details[:hourly_weather][0]).to_not have_key(:visibility)
    expect(details[:hourly_weather][0]).to_not have_key(:weather)
    expect(details[:hourly_weather][0]).to_not have_key(:pop)

    expect(details[:daily_weather][0]).to_not have_key(:temp)
    expect(details[:daily_weather][0]).to_not have_key(:feels_like)
    expect(details[:daily_weather][0]).to_not have_key(:pressure)
    expect(details[:daily_weather][0]).to_not have_key(:humidity)
    expect(details[:daily_weather][0]).to_not have_key(:dew_point)
    expect(details[:daily_weather][0]).to_not have_key(:wind_speed)
    expect(details[:daily_weather][0]).to_not have_key(:wind_deg)
    expect(details[:daily_weather][0]).to_not have_key(:weather)
    expect(details[:daily_weather][0]).to_not have_key(:clouds)
    expect(details[:daily_weather][0]).to_not have_key(:pop)
    expect(details[:daily_weather][0]).to_not have_key(:uvi)
  end

  def image_exposure_structure(parsed)
    expect(parsed).to have_key(:data)
    expect(parsed[:data]).to be_a(Hash)

    data = parsed[:data]

    expect(data).to have_key(:id)
    expect(data[:id]).to eq(nil)

    expect(data).to have_key(:type)
    expect(data[:type]).to eq('image')

    details = data[:attributes]
    expect(details).to be_a(Hash)

    expect(details).to have_key(:description)
    expect(details[:description]).to be_a(String).or eq(nil)

    expect(details).to have_key(:url)
    expect(details[:url]).to be_a(String)

    expect(details).to have_key(:credits)
    expect(details[:credits]).to be_a(Hash)

    expect(details[:credits]).to have_key(:artist_username)
    expect(details[:credits][:artist_username]).to be_a(String)

    expect(details[:credits]).to have_key(:artist_name)
    expect(details[:credits][:artist_name]).to be_a(String)

    expect(details[:credits]).to have_key(:profile_url)
    expect(details[:credits][:profile_url]).to be_a(String)
  end

  def image_exposure_excluded_fields(parsed)
    details = parsed[:data][:attributes]

    expect(details).to_not have_key(:total)
    expect(details).to_not have_key(:total_pages)
    expect(details).to_not have_key(:results)
  end

  def user_exposure_structure(parsed)
    expect(parsed).to be_a(Hash)
    expect(parsed).to have_key(:data)
    expect(parsed[:data]).to be_a(Hash)

    expect(parsed[:data]).to have_key(:type)
    expect(parsed[:data][:type]).to eq('users')

    expect(parsed[:data]).to have_key(:id)
    expect(parsed[:data][:id]).to be_a(String)

    expect(parsed[:data]).to have_key(:attributes)
    expect(parsed[:data][:attributes]).to be_a(Hash)

    expect(parsed[:data][:attributes]).to have_key(:email)
    expect(parsed[:data][:attributes][:email]).to be_a(String)

    expect(parsed[:data][:attributes]).to have_key(:api_key)
    expect(parsed[:data][:attributes][:api_key]).to be_a(String)

    expect(parsed[:data][:attributes]).to_not have_key(:password)
    expect(parsed[:data][:attributes]).to_not have_key(:password_digest)
    expect(parsed[:data][:attributes]).to_not have_key(:password_confirmation)
    expect(parsed[:data][:attributes]).to_not have_key(:created_at)
    expect(parsed[:data][:attributes]).to_not have_key(:updated_at)
  end

  def roadtrip_exposure_structure(parsed)
    expect(parsed).to be_a(Hash)
    expect(parsed).to have_key(:data)
    expect(parsed[:data]).to be_a(Hash)

    expect(parsed[:data]).to have_key(:id)
    expect(parsed[:data][:id]).to eq(nil)

    expect(parsed[:data]).to have_key(:type)
    expect(parsed[:data][:type]).to eq('roadtrip')

    expect(parsed[:data]).to have_key(:attributes)
    expect(parsed[:data][:attributes]).to be_a(Hash)

    details = parsed[:data][:attributes]

    expect(details).to have_key(:start_city)
    expect(details[:start_city]).to be_a(String)

    expect(details).to have_key(:end_city)
    expect(details[:start_city]).to be_a(String)

    expect(details).to have_key(:travel_time)
    expect(details[:start_city]).to be_a(String)

    expect(details).to have_key(:travel_time)
    expect(details[:start_city]).to be_a(String)

    expect(details).to have_key(:weather_at_eta)
    expect(details[:weather_at_eta]).to be_a(Hash)

    expect(details[:weather_at_eta]).to have_key(:temperature)
    expect(details[:weather_at_eta][:temperature]).to be_a(Numeric)

    expect(details[:weather_at_eta]).to have_key(:conditions)
    expect(details[:weather_at_eta][:conditions]).to be_a(String)
  end
end