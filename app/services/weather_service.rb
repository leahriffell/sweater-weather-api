class WeatherService
  def self.fetch_forecast(lat, long)
    response = conn.get do |request|
      request.params['appid'] = ENV['WEATHER_API_KEY']
      request.params['lat'] = lat
      request.params['lon'] = long
      request.params['units'] = 'imperial'
      request.params['exclude'] = 'minutely'
    end
    parse(response)
  end

  def self.future_forecast(lat, long, time)
    hour = round_hour(time.gsub(':','.')[0..-4])
    if fetch_forecast(lat, long)[:hourly][hour].nil?
      { temp: 'ETA is too far out to receive forecast', weather: [{ description: 'ETA is too far out to receive forecast' }]}
    else
      fetch_forecast(lat, long)[:hourly][hour]
    end
  end

  private
  
  def self.conn
    Faraday.new(url: 'https://api.openweathermap.org/data/2.5/onecall?')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.round_hour(hours_minutes)
    if hours_minutes.last(2).to_i < 30
      hours_minutes.to_i
    else
      hours_minutes.to_i + 1
    end
  end
end