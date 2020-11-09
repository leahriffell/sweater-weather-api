class TrailsService
  def self.search_nearby_trails(lat, long)
    response = conn.get do |request|
      request.params['key'] = ENV['TRAILS_API_KEY']
      request.params['lat'] = lat
      request.params['lon'] = long
    end
    parse(response)
  end

  private
  
  def self.conn
    Faraday.new(url: 'https://www.hikingproject.com/data/get-trails?')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
