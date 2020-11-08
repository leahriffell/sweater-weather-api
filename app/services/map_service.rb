class MapService
  def self.forward_geocode(city_state)
    response = conn.get("/geocoding/v1/address?") do |request|
      request.params['key'] = ENV['MAP_API_KEY']
      request.params['location'] = city_state.delete(" ")
    end
    parsed = parse(response)
    parsed[:results][0][:locations][0][:latLng]
  end

  private
  
  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end