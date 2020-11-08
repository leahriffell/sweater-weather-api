class ForecastFacade
  def self.forecast(location)
    latlng = MapService.forward_geocode(location)
    Forecast.new(WeatherService.fetch_forecast(latlng[:lat], latlng[:lng]))
  end
end