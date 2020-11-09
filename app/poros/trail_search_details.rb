class TrailSearchDetails
  attr_reader :location,
              :forecast,
              :trails

  def initialize(location)
    @location = location
    @forecast = { summary: ForecastFacade.forecast(location).current_weather.conditions, temperature: ForecastFacade.forecast(location).current_weather.temperature }
    @trails = TrailsFacade.nearby_trails(location)
  end
end
