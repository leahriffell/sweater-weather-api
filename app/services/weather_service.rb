class WeatherService
  def self.fetch_forecast(lat, long)
    response = conn.get do |request|
      request.params['appid'] = ENV['WEATHER_API_KEY']
      request.params['lat'] = lat
      request.params['lon'] = long
    end
    parse(response)
  end

  private
  
  def self.conn
    Faraday.new(url: 'https://api.openweathermap.org/data/2.5/onecall?')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end