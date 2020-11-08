require 'rails_helper'

RSpec.describe 'Hourly Forecast poro' do
  it 'exists' do
    attr = {
            :dt=>1604872800,
            :temp=>55.45,
            :feels_like=>43.02,
            :pressure=>1003,
            :humidity=>20,
            :dew_point=>16.95,
            :clouds=>10,
            :visibility=>10000,
            :wind_speed=>12.46,
            :wind_deg=>196,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
            :pop=>0
          }
          
    forecast = HourlyForecast.new(attr)

    expect(forecast).to be_a(HourlyForecast)

    expect(forecast.time).to eq('15:00:00')
    expect(forecast.temperature).to eq(attr[:temp])
    expect(forecast.wind_speed).to eq(attr[:wind_speed].to_s)
    expect(forecast.wind_direction).to eq('S')
    expect(forecast.conditions).to eq(attr[:weather][0][:description])
    expect(forecast.icon).to eq(attr[:weather][0][:icon])
  end
end
