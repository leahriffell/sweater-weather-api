class ForecastFacade
  def self.forecast(location)
    GeocodeService.forward_geocode(location)
  end
end