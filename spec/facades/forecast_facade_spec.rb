require 'rails_helper'

RSpec.describe 'Forecast Facade' do
  it 'returns the forecast for a city' do
    forecast = ForecastFacade.forecast('Denver, CO')

    expect(forecast).to be_a(Forecast)
    expect(forecast.current_weather).to be_a(CurrentWeather)

    expect(forecast.daily_weather).to be_an(Array)
    forecast.daily_weather.each do |daily|
      expect(daily).to be_a(DailyForecast)
    end

    expect(forecast.hourly_weather).to be_an(Array)
    forecast.hourly_weather.each do |hourly|
      expect(hourly).to be_a(HourlyForecast)
    end
  end
end