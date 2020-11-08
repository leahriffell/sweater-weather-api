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

    expect(response[:results][0][:locations][0][:latLng][:lat]).to be_an(Float)
    expect(response[:results][0][:locations][0][:latLng][:lng]).to be_an(Float)
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
    expect(response[:current][:temp]).to be_a(Float)

    expect(response[:current]).to have_key(:feels_like)
    expect(response[:current][:feels_like]).to be_a(Float)

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
      expect(daily[:temp][:max]).to be_a(Float)

      expect(daily[:temp]).to have_key(:min)
      expect(daily[:temp][:min]).to be_a(Float)

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
      expect(hourly[:wind_speed]).to be_a(Float)

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
    expect(data[:attributes][:current_weather][:temperature]).to be_a(Float)

    expect(data[:attributes][:current_weather]).to have_key(:feels_like)
    expect(data[:attributes][:current_weather][:feels_like]).to be_a(Float)

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
      expect(daily[:max_temp]).to be_a(Float)

      expect(daily).to have_key(:min_temp)
      expect(daily[:min_temp]).to be_a(Float)

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
  end
end