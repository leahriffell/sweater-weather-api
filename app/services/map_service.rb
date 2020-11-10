class MapService
  def self.forward_geocode(city_state)
    response = conn.get("/geocoding/v1/address?") do |request|
      request.params['key'] = ENV['MAP_API_KEY']
      request.params['location'] = city_state.delete(" ")
    end
    parsed = parse(response)
    parsed[:results][0][:locations][0][:latLng]
  end

  def self.fetch_trip_duration(start_location, end_location)
    response = conn.get("directions/v2/route?") do |request|
      request.params['key'] = ENV['MAP_API_KEY']
      request.params['from'] = start_location
      request.params['to'] = end_location
    end
    route_duration(parse(response)[:route][:formattedTime])
  end

  private
  
  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.route_duration(response)
    if response.nil?
      'impossible'
    else
      response
    end
  end
end