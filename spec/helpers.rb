module Helpers
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
end