class TrailSearchDetails
  attr_reader :location,
              :forecast,
              :trails

  def initialize(location, weather, trails)
    @location = location
    @forecast = {summary: weather.conditions, temperature: weather.temperature}
    @trails = trails
  end
end