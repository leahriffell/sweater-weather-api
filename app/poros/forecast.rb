class Forecast
  attr_reader :current_weather,
              :daily_weather,
              :hourly_weather

  def initialize(details)
    @current_weather = CurrentWeather.new(details[:current])
    @daily_weather = details[:daily][1..5].map {|daily| DailyForecast.new(daily)}
    @hourly_weather = details[:hourly][1..8].map {|hourly| HourlyForecast.new(hourly)}
  end
end